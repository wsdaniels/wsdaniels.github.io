---
title: "Papers"
permalink: /papers/
author_profile: true
classes: splash
header:
    overlay_image: https://wsdaniels.github.io/images/flatirons.jpeg
---

{% for category in site.data.papers.categories %}
  <h2>{{category.heading}}</h2>
  <ol>
  {% assign reversed_pubs = category.pubs | reverse %}
  {% for paper in reversed_pubs %}
    <li value="{{ forloop.rindex }}"><strong>{{paper.title}}</strong>.
    <br>
    {% for author in paper.authors %}
      {% if forloop.last %}
        {{author}}.
      {% else %}
        {{author}},
      {% endif %}
    {% endfor %}
    <br>
    <em>{{paper.venue}}</em>, 
    {% if paper.volumeissue %}
      {{paper.volumeissue}},
    {% endif %}
    ({{paper.year}}).
    {% if paper.links %}
    <br>
      {% for link in paper.links %}
        [<a href="{{link.url}}">{{link.text}}</a>] 
      {% endfor %}
    {% endif %}
    <br><br></li>
  {% endfor %}
  </ol>
{% endfor %}