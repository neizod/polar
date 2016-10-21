{% assign empty-title = include.list | prepend: "No " | append: "!" %}
{% capture empty-content %}

Since there are zero items in {{ include.list }}, the list shown here is empty.


{% endcapture %}
