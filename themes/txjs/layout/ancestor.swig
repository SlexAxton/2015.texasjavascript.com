<!DoCTypE html>
<html lang=en-us>
<head>
  <meta charset=utf-8>
  <!--meta name=viewport
        content="width=device-width, initial-scale=1" -->

  <meta name=apple-mobile-web-app-capable content=yes>
  <meta name=apple-mobile-web-app-status-bar-style content=black>
  <meta name=description content="{{ config.description }}">
  <link rel=icon type=image/x-icon href=/favicon.ico>
  {% block stylesheet %}
  <!-- link rel="stylesheet" href="/css/style.css" -->
  <style type="text/css">
    a,abbr,article,aside,audio,b,blockquote,body,canvas,caption,center,code,dd,details,div,dl,dt,em,embed,fieldset,figcaption,figure,footer,form,h1,h2,h3,h4,h5,h6,header,hgroup,html,i,iframe,img,label,li,mark,menu,nav,ol,output,p,pre,ruby,section,small,span,strike,strong,summary,table,tbody,td,tfoot,th,thead,time,tr,u,ul,video{margin:0;padding:0;border:0;font-size:100%;font:inherit;vertical-align:baseline}body{line-height:1}ol,ul{list-style:none}blockquote,q{quotes:none}blockquote:after,blockquote:before,q:after,q:before{content:'';content:none}table{border-collapse:collapse;border-spacing:0}html{font-family:'Helvetica Neue';font-size:100%;-webkit-font-smoothing:antialiased}p{line-height:1.5rem;margin-top:0;margin-bottom:1.5rem}ol,ul{margin-top:1.5rem;margin-bottom:1.5rem}ol li,ul li{line-height:1.5rem}ol ol,ol ul,ul ol,ul ul{margin-top:0;margin-bottom:0}blockquote{line-height:1.5rem;margin-top:1.5rem;margin-bottom:1.5rem}h1,h2,h3,h4,h5,h6{margin-top:0;margin-bottom:1.5rem;line-height:1.5rem;font-weight:700}h1{font-size:3rem;line-height:3rem;letter-spacing:-.16rem}h2{font-size:1.85rem;line-height:2.25rem;letter-spacing:-.08rem}h3{font-size:1rem}h4{font-size:.5rem}h5{font-size:.333333333333333rem}h6{font-size:.25rem}table{margin-top:1.5rem;border-spacing:0;border-collapse:collapse}td,th{padding:0;line-height:24px}code{vertical-align:bottom}.lead{font-size:1rem}.hug{margin-top:0}.container-fluid{margin-right:auto;margin-left:auto;padding-right:2rem;padding-left:2rem}.row{box-sizing:border-box;display:-webkit-flex;display:-ms-flexbox;display:-webkit-box;display:flex;-webkit-flex:0 1 auto;-ms-flex:0 1 auto;-webkit-box-flex:0;flex:0 1 auto;-webkit-flex-direction:row;-ms-flex-direction:row;-webkit-box-orient:horizontal;-webkit-box-direction:normal;flex-direction:row;-webkit-flex-wrap:wrap;-ms-flex-wrap:wrap;flex-wrap:wrap;margin-right:-.5rem;margin-left:-.5rem}.col-xs,.col-xs-4{box-sizing:border-box;-webkit-flex:0 0 auto;-ms-flex:0 0 auto;-webkit-box-flex:0;flex:0 0 auto;padding-right:.5rem;padding-left:.5rem}.col-xs{-webkit-flex-grow:1;-ms-flex-positive:1;-webkit-box-flex:1;flex-grow:1;-webkit-flex-basis:0;-ms-flex-preferred-size:0;flex-basis:0;max-width:100%}.col-xs-4{-webkit-flex-basis:33.333%;-ms-flex-preferred-size:33.333%;flex-basis:33.333%;max-width:33.333%}body{overflow:hidden;color:#444}a{color:#e2273a;text-decoration:none}a:hover{text-decoration:underline}h1,h2,h3,h4,h5,h6{color:#2a2c5c}h1 em{font-weight:400;font-size:85%;letter-spacing:0}.title-date{margin:0 0 .25rem}::-webkit-scrollbar{width:8px}::-webkit-scrollbar-track{border-radius:10px}::-webkit-scrollbar-thumb{border-radius:10px;background:rgba(0,0,0,.2)}::-webkit-scrollbar-thumb:window-inactive{background:rgba(0,0,0,.2)}.row{margin-bottom:2.5rem}.row.small-bottom{margin-bottom:.5rem}.container-article{padding:6rem 1rem 1rem}.ribbon{width:220px;color:#fff;text-align:right;font-size:.75rem;overflow-x:hidden;overflow-y:scroll;position:fixed;top:calc(220px + 1.5rem);bottom:5px;z-index:1;padding-left:calc(40% - 220px - 5px - 1.5rem);padding-right:1rem}#header .logo{max-width:220px;z-index:2;position:absolute;right:0}#header .title{text-indent:-9999px;margin:0;height:0;overflow:hidden}#header:after{content:'';background-color:#2a2c5c;opacity:.95;position:fixed;top:0;right:60%;bottom:0;width:calc(220px + 2rem + 10px)}#header h3{margin:0 0 .5rem;color:#fff}#header ul{margin:0 0 1.5rem}#header ul li .time{display:inline-block;min-width:3.5rem;font-weight:700;text-transform:uppercase;opacity:.5}.container-header{position:fixed;width:40%;top:0;bottom:0;left:0;background-color:#ccc;background-image:url(/pixels/bluebonnets.jpg);background-size:cover}.container-article{position:fixed;top:5px;right:5px;bottom:5px;left:40%;overflow-y:auto;padding-right:16.66666%}.section-header--sponsored{margin-bottom:4px}.presented-by{font-size:16px}.time-header{font-weight:500;margin-bottom:.25rem}.innerheader{font-size:26px;font-variant:smallcaps}p strong{font-weight:700}p em{font-style:italic}.speaker-list{padding:10px 10px 10px 0}.speaker-list img{max-height:150px;max-width:150px;width:100%;background-color:#888;display:inline-block}.speaker-list .speaker-label{display:block;margin-bottom:.5rem;text-align:center}.speaker-list img{border:3px solid #333;border-radius:3px}.food-header{font-size:22px;margin-bottom:.5rem}.food-note{font-size:12px;padding-left:10px;color:#555}.food-group{margin-top:.5rem}.food-group li a{font-size:18px}.row.small-bottom.big-space{margin-bottom:10rem}#menu a{color:#fff}@media only screen and (max-width:64em){.container-article{padding-right:1rem}}#footer{margin-top:100px}
  </style>
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
  if ('serviceWorker' in navigator) {
    navigator.serviceWorker.register('/sw.js', {scope: '/'}).catch(function(error) {
      console.error('Couldn\'t register service worker.');
      throw error;
    });
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
