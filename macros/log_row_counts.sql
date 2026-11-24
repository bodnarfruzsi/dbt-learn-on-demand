{% macro log_row_counts(model_names) -%}
    {% for model_name in model_names %}
        {% set count_query %}
            select count(*) as row_count from {{ ref(model_name) }}
        {% endset %}
        {% set result = run_query(count_query) %}
        {% do log(model_name ~ ': ' ~ result.columns[0].values()[0] ~ ' rows', info=True) %}
    {% endfor %}
{%- endmacro %}
