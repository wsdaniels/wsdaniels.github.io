---
title: "Code & Data"
permalink: /code/
author_profile: true
classes: splash
header:
    overlay_image: https://wsdaniels.github.io/images/utah3.jpeg

---

<div>
	{% for repo in site.data.code.repos %}
  <h2>{{repo.title}}</h2>
  {% if repo.image_path %}
	<div id="chartContainer">
		<a href=
            {% if repo.links[0].url contains "://" %}
              "{{ repo.links[0].url }}"
            {% else %}
              "{{ repo.links[0].url | relative_url }}"
            {% endif %}
            title="{{ repo.title }}"
        >
        <img class="thumb" src=
          {% if repo.image_path contains "://" %}
            "{{ repo.image_path }}"
          {% else %}
            "{{ repo.image_path | relative_url }}"
          {% endif %}
          alt="{{ repo.title }}">
        </a>
  </div> 
  {% endif %}
  <p>{{repo.description}}
    <br>
  {% for link in repo.links %}
    [<a href="{{link.url}}">{{link.text}}</a>]
  {% endfor %}
  </p>
	{% endfor %}
</div>
		