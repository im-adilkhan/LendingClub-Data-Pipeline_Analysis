{% macro calculate_ratio(a,b) %}

(a / NULLIF(b,0))

{% endmacro %}