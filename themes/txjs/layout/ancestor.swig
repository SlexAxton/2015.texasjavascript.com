<!DoCTypE html>
<html lang=en-us>
<head>
  <meta charset=utf-8>
  <meta name=viewport content="width=device-width, initial-scale=1">
  <meta name=apple-mobile-web-app-capable content=yes>
  <meta name=apple-mobile-web-app-status-bar-style content=black>
  <meta name=description content="{{ config.description }}">
  <link rel=icon type=image/x-icon href=/favicon.ico>
  {% block stylesheet %}
  <link rel="stylesheet" href="/css/style.css">
  {% endblock %}
  <title>{% block title %}{{ config.title }}{% endblock %}</title>
</head>
<body>
<div class="container-fluid">
  <div class="row">
    <div class="container-header">
      {% include '_partial/header.swig' %}
    </div>
    <div class="container-article">
      <article id="content" class="container-fluid">
        {% block primary %}{% endblock %}
      </article>
      {% include '_partial/footer.swig' %}
    </div>
  </div>
</div>

{% block scripts %}
<script>
  function sendMessage(message) {
    if (navigator.serviceWorker.controller) {
      navigator.serviceWorker.controller.postMessage(message);
    }
    else {
      console.log('Cant postmessage, probably a hard refresh.');
    }
  }

  window.addEventListener('message', function(event) {
    if (event.data === 'PAGEUPDATEDYO') {
      location.reload();
    }
  });

  if ('serviceWorker' in navigator) {
    navigator.serviceWorker.register('/sw.js')
      .then(navigator.serviceWorker.ready)
      .then(function(){
        sendMessage('OKIMREADYFORTHIS');
      }).catch(function(error) {
        console.error('Couldn\'t register service worker.');
        throw error;
      });
  }

  function setMenuTimes(isFirstRun) {
    var currentTime = new Date();

    if (
      currentTime.getMonth() === 6 &&
      currentTime.getDate() === 23
    ) {
      document.getElementById('the23rd').classList.add('active');
      return;
    }
    if (
      currentTime.getMonth() === 6 &&
      currentTime.getDate() === 25
    ) {
      document.getElementById('the25th').classList.add('active');
      return;
    }

    // Otherwise set the date to the 24th, regardless
    var the24thElem = document.getElementById('the24th');
    the24thElem.classList.add('active');

    if (
      currentTime.getMonth() !== 6 ||
      currentTime.getDate() !== 24 ||
      currentTime.getFullYear() !== 2015
    ) {
      // If it's not the day, don't worry about the timer
      return;
    }

    window.isThe24th = true;

    var times = [{
      label: 'registration',
      offset: 0, // July 24, 8am CT
    },{
      label: 'welcome',
      offset: 45, // July 24, 8:45am CT
    },{
      label: 'scarystuff',
      offset: 55, // July 24, 8:55am CT
    },{
      label: 'uxandperf',
      offset: 155, // July 24, 10:35am CT
    },{
      label: 'lunch',
      offset: 245, // July 24, 12:05pm CT
    },{
      label: 'frameworkunshootout',
      offset: 335, // July 24, 1:35pm CT
    },{
      label: 'thefuture',
      offset: 440, // July 24, 3:20pm CT
    },{
      label: 'expandyourmind',
      offset: 545, // July 24, 5:05pm CT
    },{
      label: 'afterparty',
      offset: 635, // July 24, 6:35pm CT
    },/*lolhacks*/{
      label: 'afterparty',
      offset: 636, // July 24, 6:35pm CT
    },{
      label: 'afterparty',
      offset: 637, // July 24, 6:35pm CT
    }];

    var timesStart = new Date(Date.UTC(2015, 6, 24, 13, 0));
    var currentOffset = currentTime.getTime() - timesStart.getTime();

    var selectedTime = times[0];

    // bail if it's too early
    if (currentOffset > 0) {
      for (var i = 0; i < times.length; i++) {
        if ((selectedTime.offset*60*1000) > currentOffset) {
          selectedTime = times[i-2];
          break;
        }
        selectedTime = times[i];
      }
    }

    // Add the active class to the li element
    var activeLinkElem = the24thElem
      .querySelector('[href="/#'+selectedTime.label+'"]');

    activeLinkElem.parentNode.classList.add('active');

    if (isFirstRun && location.pathname === '/') {
      activeLinkElem.click();
    }
  }

  setMenuTimes(true);

  if (window.isThe24th) {
    setInterval(function() {
      var currentActive = document.querySelector('#the24th .active');
      currentActive && currentActive.classList.remove('active');
      setMenuTimes();
    },1000*6);
  }

  (function(
    o,m,g, t,x,j,s
  ){o['GoogleAnalyticsObject']=x;o[x]=o[x]||function(){
    (o[x].q=o[x].q||[]).push(arguments)},o[x].l=1*new Date();j=m.createElement(g),
    s=m.getElementsByTagName(g)[0];j.async=1;j.src=t;s.parentNode.insertBefore(j,s)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', '{{ config.google_analytics }}', 'auto');
  ga('send', 'pageview');
</script>
{% endblock %}

</body>
</html>
<!--
And Always Remember:

####################################################################################################
#W##################################################################################################
#################################################W##################################################
###############################################W##D#################################################
###############################################W#i #################################################
#################################################  W################################################
################################################f   ################################################
#########################################W######    W###############################################
###############################################D     ###############################################
########################################Wj                .W########################################
########################################WWL              :##########################################
############################################f          .#W##########################################
#############################################L        :WW###########################################
##############################################        fW############################################
#############################################j         #############################################
#############################################          #############################################
##########################################WW#    ##i   K############################################
############################################K  K###W#  :W###########################################
###########################################W W#WW###### ############################################
######################################################W#############################################
########################################################W###########################################
####################################################################################################



                                                                #
                        iiiiiiiii.                             ###
                        ############t                          ###
                          ####   i###i                         ###  ###;
                          t###    .###:                        K##  ###;
                          ,###     ####.                         #  ###;
                          ,###     .####                         D  ###;
                          ,###      ####     GW#Wt     ,it  W#K     ###;
                          ,###      K###,   ###W##E K####W #####  ########j
                          ,###      j###E  ###  j##W:####W######, ########j
                          ,###      .#### ###f   ###L ####G :####   ###i
                          ,###       #### ###    E### ####   ####   ###i
                          ,###       ####;###    i### ###W   E###   ###i
                          ,###       ####D###    :###.###W   G###   ###i
                          ,###       ########     ###t###W   G###   ###i
                          ,###       ########     ###j###W   G###   ###i
                          ,###      .########     ###j###W   D###   ###i
                          ,###      i###f####    .###;###W   D###   ###i             ,tGK#:
                          ,###      D### E###    :### ###W   G###   ###i             #####:
                          ,###      #### .###    j### ###W   G###   ###t              L###:
                          ,###      ###L  ###    E### ###W   G###   ###L               ###:
                          ,###.    E###   ###f   ###f ###W   D###   ####        jjj.   ###:
                          L###E   ,###     ###  t##K t####   ####i  ######K     ###:   ###:
                        .j#####Wf####       ###K##E j###### ####W#j .#####D     ###:   ###:
                        ##########j           fGi                     ,j,       ###:   ###:
         .                ..         ..  .      .   :                           ###:   ###:   .
 ##### j####  G####     ######     #######    #######   ######:  ##f  ################ ###:t####
 f#### #####W #####i   E## .###   ;##  .##   ##W  ###   ,####,   ##W   ##W############ ###:#####W
  :####E.#####L.####  :##f  ###,  ###   K#   ##    ##    f###    ###   i# E###  ###,   ###WE.W###
   ###i  i###E   ###  ###   W###  ###    #  L##.    #     ###   G###   D# .###  ###;   ####   ###
   ###   .###    ###  ###   K### :###    K  D###    #     ###j  ####   #j .###  ###;   ###:   ###.
   ###    ###    ###  ###   D###  #####i    L#####        ####  ####j  #  .###  ###;   ###:   ###:
   ###    ###    ### :##########  ######W   .######L      E### .#W###  #  .###  ###;   ###:   ###:
   ###    ###    ### ;###         f#######   ########      ###:LGi### .f  .###  ###;   ###:   ###:
   ###    ###    ### ;###          #######   ;#######      ###D#: ###.G.  .###  ###;   ###:   ###:
   ###    ###    ### :###           W#####t   .######      #####  ###L#   .###  ###;   ###:   ###:
   ###    ###    ###  ###,       K,   j###G #    E###:     t####  E####   .###  ###;   ###:   ###:
   ###    ###    ###  ###K     W EW    j##G #     ###.      ###K  ,####   .###  ###i   ###:   ###:
   ###    ###    ###  ####.   f# E#     ##: ##    ###       ###:   ###i   .###  ###E   ###:   ###:
   ###    ###,   ###  :####  f#L D#K   .##  ##;   ###       ###    ###    :###  f###:  ###t   ###t
 ;#####. W####..E####t D#######  G##D  ###  ###.  ##G       ###    D##   j#####, ##########. L####G
 DDDDDD, DDDDD.,DDDDDG  ,####:   Lf,####,   # f####         i##    :#W   DDDDDDj f###DDDDDDi DDDDDD

                      ##############t
                      ##############t
                      ##   ####   ##t:LL:                   .fGj.       tj: i.
                      ##   ####   L#######  K###### L###K  E#####L    j######;
                      #i   ####    ###  ### ,#####: .###, ###  ###,  i##L j##;
                      #    ####   ,##.  ###G  ####   W#   ###  G###  ###    #t
                      K    ####   ###   ####  L###:  #i  ;###  i### ;###    #j
                           ####  .###   W###   #### DE    ###  ;### L###.   if
                           ####  L###   K###   ####:#     ##;  ,### L####;
                           ####  W###EKK####.  .####W          #### ;######t
                           ####  ####KKKKKKK.   W###t       L##D###  ########
                           ####  ####            ####      ###:,###  j#######t
                           ####  ####           t####     ###  ;###   .#######
                           ####  K###           #.###E   G##W  ;### t   G#####  t
                           ####  i###.     .   #D ####   ###G  ;### #.    W### ###.
                           ####   ###K     #G  #  t###K  ###D  ;### #W     ###i###W
                           ####   ####    f#  #G   ####  ####  K### ##     ###E####
                           ####    #####j##; ##    G###E W#####W###E###   ,##,f####
                           ####    G######G ####; ####### ##### ########,t##W  ###f
                           ####      E##W   ....  ....... ,##D   ###L  E###.   :#j
                           ####
                           ####
                         W#######.
                         ########:



EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE    EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE    EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE    EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE    fEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEED       ... .DEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEL            jEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEf            iEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEt..:,:            .EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEt                 GEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEt           X    DEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE          TXJS DEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEED,  DL         ,tEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEj     EDEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE.   DEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEED  ;EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE:  EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE,EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

-->
