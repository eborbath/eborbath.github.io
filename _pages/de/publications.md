---
layout: page
permalink: /publications/
title: publikationen
description:
article_years: [2026, 2025, 2024, 2023, 2022, 2021, 2020, 2019, 2012, 2011]
review_years: [2022, 2017, 2016]
chapter_years: [2024, 2022, 2021, 2020, 2019, 2018]
working_paper_year: [2024, 2023]
in_list: 3
nav: true
nav_order: 3
toc:
  sidebar: left
lang: de
---

{% include bib_search.liquid %}

## Artikel in peer-reviewten Fachzeitschriften

<div class="publications">
{% bibliography -f papers -q @article* %}
</div>

## Working Papers online

<div class="publications">
{% bibliography -f papers -q @report* %}
</div>

## Buchkapitel

<div class="publications">
{% bibliography -f papers -q @incollection* %}
</div>

## Buchbesprechungen

<div class="publications">
{% bibliography -f papers -q @misc* %}
</div>
