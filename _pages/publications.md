---
layout: page
permalink: /publications/
title: publications
description:
article_years: [2025, 2024, 2023, 2022, 2021, 2020, 2019, 2012, 2011]
review_years: [2022, 2017, 2016]
chapter_years: [2024, 2022, 2021, 2020, 2019, 2018]
working_paper_year: [2024, 2023]
in_list: 3
nav: true
nav_order: 3
toc:
  sidebar: left
---

{% include bib_search.liquid %}

## Articles in peer reviewed journals

<div class="publications">
{% bibliography -f papers -q @article* %}
</div>

## Working papers online

<div class="publications">
{% bibliography -f papers -q @report* %}
</div>

## Chapters in edited volumes

<div class="publications">
{% bibliography -f papers -q @incollection* %}
</div>

## Book reviews

<div class="publications">
{% bibliography -f papers -q @misc* %}
</div>
