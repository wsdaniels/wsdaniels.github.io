---
title: "Slides"
permalink: /slides/
author_profile: true
classes: splash
header:
    overlay_image: https://wsdaniels.github.io/images/utah.jpg
---

See my [CV](https://wsdaniels.github.io/files/william_daniels_CV_full.pdf) for a full list of talks and a selection of poster presentations. Below are some slides that may be useful.

<div>
    {% for deck in site.data.slides.slides %}
    <figure>
        <a href=
            {% if deck.url contains "://" %}
              "{{ deck.url }}"
            {% else %}
              "{{ deck.url | relative_url }}"
            {% endif %}
            title="{{ deck.title }}"
        >
        <img class="thumb" width="300" src=
          {% if deck.image_path contains "://" %}
            "{{ deck.image_path }}"
          {% else %}
            "{{ deck.image_path | relative_url }}"
          {% endif %}
          alt="{{ deck.title }}">
        </a>
        <figcaption>
        {{deck.title}}
        </figcaption>
    </figure>
    {% endfor %}
</div>