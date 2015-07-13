<!DoCTypE html>
<html lang=en-us>
<head>
  <meta charset=utf-8>
  <meta name=viewport
        content="width=device-width, initial-scale=1">

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
<script src="/js/txjs.js"></script>
<script>
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
