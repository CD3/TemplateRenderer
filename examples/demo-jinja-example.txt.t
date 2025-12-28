{%
 set lengths = [ 1.1, 1.2, 1.0, 1.2 ]
%}
Measurements:
{% for l in lengths %}
  {{l}} cm
{% endfor %}

Avg: {{ (lengths | sum) / (lengths | length) }} cm
