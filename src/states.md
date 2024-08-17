---
layout: page
title: States and Counties
page_class: post
paginate:
  collection: states
---
  
<%= liquid_render "bridgetown_quick_search/search" %>

Search for a state using the search bar above


<aside>
<nav>
<ul>
<% for state in paginator.resources %>
  <li><a href="#{link state.relative_url}"><%= state.data.title %></a></li>
<% end %>
</ul>
</nav>
</aside>
<hr>
<% if paginator.total_pages > 1 %>
  <nav role="group">
    <ul>
    <% if paginator.previous_page %>
    <li>
      <a href="<%= paginator.previous_page_path %>">Previous Page</a>
    </li>
    <% end %>
    <% if paginator.next_page %>
    <li>
      <a href="<%= paginator.next_page_path %>">Next Page</a>
    </li>
    <% end %>
    </ul>
  </nav>
<% end %>