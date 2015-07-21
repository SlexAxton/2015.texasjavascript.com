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
var CACHE_VERSION = 2;
var CURRENT_CACHES = {
  'read-through': 'read-through-cache-v' + CACHE_VERSION
};
self.addEventListener('activate', function(event) {
  var expectedCacheNames = Object.keys(CURRENT_CACHES).map(function(key) {
    return CURRENT_CACHES[key];
  });
  event.waitUntil(
    caches.keys().then(function(cacheNames) {
      return Promise.all(
        cacheNames.map(function(cacheName) {
          if (expectedCacheNames.indexOf(cacheName) == -1) {
            //console.log('Deleting out of date cache:', cacheName);
            return caches.delete(cacheName);
          }
        })
      );
    })
  );
});

self.addEventListener('fetch', function(event) {
  //console.log('Handling fetch event for', event.request.url);
  event.respondWith(
    caches.open(CURRENT_CACHES['read-through']).then(function(cache) {
      return cache.match(event.request).then(function(response) {
        if (response) {
          //console.log(' Found response in cache:', response);
          return response;
        } else {
          //console.log(' No response for %s found in cache. About to fetch from network...', event.request.url);
          return fetch(event.request.clone()).then(function(response) {
            //console.log('  Response for %s from network is: %O', event.request.url, response);
            if (response.status < 400) {
              cache.put(event.request, response.clone());
            }
            return response;
          });
        }
      }).catch(function(error) {
        //console.error('  Read-through caching failed:', error);
        throw error;
      });
    })
  );
});
