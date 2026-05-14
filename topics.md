---
layout: page
title: Topics
permalink: /topics/
---
<p>Browse posts by topic.</p>

{%- assign sorted_tags = site.tags | sort -%}

<div class="taxonomy-index">
  {%- for tag in sorted_tags -%}
    <a class="taxonomy-chip" href="#{{ tag[0] | slugify }}">{{ tag[0] }} ({{ tag[1] | size }})</a>
  {%- endfor -%}
</div>

{%- for tag in sorted_tags -%}
  <section class="taxonomy-section" id="{{ tag[0] | slugify }}">
    <h2>{{ tag[0] }}</h2>
    <ul class="taxonomy-post-list">
      {%- assign posts = tag[1] | sort: "date" | reverse -%}
      {%- for post in posts -%}
        <li><a href="{{ post.url | relative_url }}">{{ post.title }}</a> <span class="taxonomy-date">{{ post.date | date: "%b %-d, %Y" }}</span></li>
      {%- endfor -%}
    </ul>
  </section>
{%- endfor -%}

<p>See also the <a href="{{ '/categories/' | relative_url }}">Categories</a> page for broader groupings.</p>

{% include cta-banner.html %}
