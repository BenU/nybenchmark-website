---
layout: page
title: Categories
permalink: /categories/
---
<p>Browse posts by broad category.</p>

{%- assign sorted_categories = site.categories | sort -%}

<div class="taxonomy-index">
  {%- for category in sorted_categories -%}
    <a class="taxonomy-chip" href="#{{ category[0] | slugify }}">{{ category[0] }} ({{ category[1] | size }})</a>
  {%- endfor -%}
</div>

{%- for category in sorted_categories -%}
  <section class="taxonomy-section" id="{{ category[0] | slugify }}">
    <h2>{{ category[0] }}</h2>
    <ul class="taxonomy-post-list">
      {%- assign posts = category[1] | sort: "date" | reverse -%}
      {%- for post in posts -%}
        <li><a href="{{ post.url | relative_url }}">{{ post.title }}</a> <span class="taxonomy-date">{{ post.date | date: "%b %-d, %Y" }}</span></li>
      {%- endfor -%}
    </ul>
  </section>
{%- endfor -%}

<p>See also the <a href="{{ '/topics/' | relative_url }}">Topics</a> page for more specific tags.</p>

{% include cta-banner.html %}
