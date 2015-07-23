/*
 Copyright 2014 Google Inc. All Rights Reserved.
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 http://www.apache.org/licenses/LICENSE-2.0
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
*/

var CACHE_VERSION = 25;
var CURRENT_CACHES = {
  'read-through': 'read-through-cache-v' + CACHE_VERSION
};


// Via https://github.com/coonsta/cache-polyfill/blob/master/dist/serviceworker-cache-polyfill.js
// Adds in some functionality missing in Chrome 40.

if (!Cache.prototype.add) {
  Cache.prototype.add = function add(request) {
    return this.addAll([request]);
  };
}

if (!Cache.prototype.addAll) {
  Cache.prototype.addAll = function addAll(requests) {
    var cache = this;

    // Since DOMExceptions are not constructable:
    function NetworkError(message) {
      this.name = 'NetworkError';
      this.code = 19;
      this.message = message;
    }
    NetworkError.prototype = Object.create(Error.prototype);

    return Promise.resolve().then(function() {
      if (arguments.length < 1) throw new TypeError();

      // Simulate sequence<(Request or USVString)> binding:
      var sequence = [];

      requests = requests.map(function(request) {
        if (request instanceof Request) {
          return request;
        }
        else {
          return String(request); // may throw TypeError
        }
      });

      return Promise.all(
        requests.map(function(request) {
          if (typeof request === 'string') {
            request = new Request(request);
          }

          var scheme = new URL(request.url).protocol;

          if (scheme !== 'http:' && scheme !== 'https:') {
            throw new NetworkError("Invalid scheme");
          }

          return fetch(request.clone());
        })
      );
    }).then(function(responses) {
      // TODO: check that requests don't overwrite one another
      // (don't think this is possible to polyfill due to opaque responses)
      return Promise.all(
        responses.map(function(response, i) {
          return cache.put(requests[i], response);
        })
      );
    }).then(function() {
      return undefined;
    });
  };
}

if (!CacheStorage.prototype.match) {
  // This is probably vulnerable to race conditions (removing caches etc)
  CacheStorage.prototype.match = function match(request, opts) {
    var caches = this;

    return this.keys().then(function(cacheNames) {
      var match;

      return cacheNames.reduce(function(chain, cacheName) {
        return chain.then(function() {
          return match || caches.open(cacheName).then(function(cache) {
            return cache.match(request, opts);
          }).then(function(response) {
            match = response;
            return match;
          });
        });
      }, Promise.resolve());
    });
  };
}

self.addEventListener('install', function(event) {
  var urlsToPrefetch = [
    '/',
    '/css/style.css',
    '/pixels/sponsors/bocoup-450.png',
    '/pixels/sponsors/rmn-dark.png',
    '/pixels/sponsors/bv.png',
    '/pixels/sponsors/spiceworks-logo.svg',
    '/pixels/sponsors/spredfast-logo-2.svg',
    '/pixels/sponsors/sponsor-ustudio.svg',
    '/pixels/speaker-simon.jpg',
    '/pixels/speaker-yan.jpg',
    '/pixels/speaker-jed.jpg',
    '/pixels/speaker-michelle.jpg',
    '/pixels/speaker-andy.jpg',
    '/pixels/speaker-alice.jpg',
    '/pixels/speaker-brian.jpg',
    '/pixels/speaker-tom.jpg',
    '/pixels/speaker-pete.jpg',
    '/pixels/speaker-rushaine.jpg',
    '/pixels/speaker-mat.jpg',
    '/pixels/speaker-jake.jpg',
    '/pixels/speaker-jenna.jpg',
    '/pixels/speaker-david.jpg',
    '/pixels/speaker-jenn.jpg',
    '/pixels/sponsors/homeaway-logo.svg',
    '/pixels/sponsors/roost.png?2',
    '/pixels/sponsors/logo-jquery-foundation.svg',
  ];

  // All of these logging statements should be visible via the "Inspect" interface
  // for the relevant SW accessed via chrome://serviceworker-internals
  // console.log('Handling install event. Resources to pre-fetch:', urlsToPrefetch);

  event.waitUntil(
    caches.open(CURRENT_CACHES['read-through']).then(function(cache) {
      return cache.addAll(urlsToPrefetch.map(function(urlToPrefetch) {
        return new Request(urlToPrefetch, {mode: 'no-cors'});
      })).then(function() {
        console.log('All resources have been fetched and cached.');
      });
    }).catch(function(error) {
      // This catch() will handle any exceptions from the caches.open()/cache.addAll() steps.
      console.error('Pre-fetching failed:', error);
    })
  );
});


self.addEventListener('activate', function(event) {
  // console.log('activate event', event);
  var expectedCacheNames = Object.keys(CURRENT_CACHES).map(function(key) {
    return CURRENT_CACHES[key];
  });
  event.waitUntil(
    caches.keys().then(function(cacheNames) {
      return Promise.all(
        cacheNames.map(function(cacheName) {
          if (expectedCacheNames.indexOf(cacheName) == -1) {
            console.log('Deleting out of date cache:', cacheName);
            return caches.delete(cacheName);
          }
        })
      );
    })
  );
});

var outerPageReady = false;
var queuedMessages = [];

function sendMessage(message) {
  // console.log('sendMessage', message, outerPageReady, queuedMessages);
  if (!outerPageReady) {
    queuedMessages.push(message);
  }
  else {
    return self.clients.matchAll().then(function(clients) {
      return Promise.all(clients.map(function(client) {
        return client.postMessage(message);
      }));
    });
  }
}

function sendQueuedMessages() {
  return self.clients.matchAll().then(function(clients) {
    return Promise.all(clients.map(function(client) {
      return Promise.all(queuedMessages.map(function(message){
        return client.postMessage(message);
      }));
    }));
  });
}

self.addEventListener('message', function(event) {
  if (event.data === 'OKIMREADYFORTHIS') {
    outerPageReady = true;
    sendQueuedMessages();
  }
});


self.addEventListener('fetch', function(event) {
  if (event && event.request && event.request.url && event.request.url.indexOf('google') !== -1) {
    return;
  }
  var url = event.request.url;
  if (url.indexOf('data:') > -1) {
    return;
  }
  event.respondWith(
    caches.open(CURRENT_CACHES['read-through']).then(function(cache) {
      return cache.match(event.request).then(function(response) {
        var immediateResult;
        if (response) {
          //console.log(' Found response in cache:', response);
          immediateResult = response.clone();
        }

        // Bust images with the cache - don't always refetch.
        if (immediateResult && (
          url.indexOf('.jpg') > -1 ||
          url.indexOf('.svg') > -1 ||
          url.indexOf('.png') > -1 ||
          url.indexOf('.ico') > -1
        )) {
          // console.log('avoiding redownloading image', url);
          return immediateResult;
        }

        // Always make network requests anyways if we can. But always return what
        // we have immediately if we have it.
        var eventualResult = fetch(event.request.clone()).then(function(response) {
          if (!response || response.status !== 200 || response.type !== 'basic') {
            return response;
          }
          cache.put(event.request, response.clone());
          if (event.request.url === 'https://2015.texasjavascript.com/') {
            // trigger a reload on parent.
            if (immediateResult.headers.get('Build-Version') !== response.headers.get('Build-Version')) {
              sendMessage('PAGEUPDATEDYO');
            }
            /*else {
              console.log('Build Versions matched', immediateResult.headers.get('Build-Version'));
            }*/
          }

          return response;
        });

        return immediateResult || eventualResult;
      }).catch(function(error) {
        //swallow errors?
        console.error('  Read-through caching failed (probably offline/lie-fi):', error);
        //throw error;
      });
    })
  );
});
