---
layout: page
permalink: /repositories/
title: repositories
description: Bearbeite `_data/repositories.yml` und passe die Listen `github_users` und `github_repos` an, um dein eigenes GitHub-Profil und deine Repos einzubinden.
nav: false
nav_order: 4
lang: de
---

{% if site.data.repositories.github_users %}

## GitHub-Nutzer:innen

<div class="repositories d-flex flex-wrap flex-md-row flex-column justify-content-between align-items-center">
  {% for user in site.data.repositories.github_users %}
    {% include repository/repo_user.liquid username=user %}
  {% endfor %}
</div>

{% endif %}

{% if site.data.repositories.github_repos %}

## GitHub-Repositories

<div class="repositories d-flex flex-wrap flex-md-row flex-column justify-content-between align-items-center">
  {% for repo in site.data.repositories.github_repos %}
    {% include repository/repo.liquid repository=repo %}
  {% endfor %}
</div>

{% endif %}
