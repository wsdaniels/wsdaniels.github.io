---
title: "Slides"
permalink: /slides/
author_profile: true
classes: splash
header:
    overlay_image: https://wsdaniels.github.io/images/utah.jpg
---

<div class="slides-grid">
  {% for slide in site.data.slides %}
    <div class="slide-card">
      <a href="{{ slide.link }}" target="_blank">
        <img src="{{ slide.image }}" alt="{{ slide.title }}">
        <div class="slide-title">{{ slide.title }}</div>
      </a>
    </div>
  {% endfor %}
</div>