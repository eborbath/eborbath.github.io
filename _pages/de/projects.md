---
layout: page
title: projekte
permalink: /projects/
description:
display_categories:
description:
nav: false
nav_order:
horizontal: false
lang: de
---

<!-- pages/projects.md -->
<div class="projects">
{% if site.enable_project_categories and page.display_categories %}
  <!-- Display categorized projects -->
  {% for category in page.display_categories %}
  <a id="{{ category }}" href=".#{{ category }}">
    <h2 class="category">{{ category }}</h2>
  </a>
  {% assign selected_projects = site.projects | where: "category", category %}
{% include projects.liquid projects=selected_projects %}
  {% endfor %}
{% else %}
  <!-- Display projects without categories -->
  {% include projects.liquid projects=site.projects %}
{% endif %}
</div>
