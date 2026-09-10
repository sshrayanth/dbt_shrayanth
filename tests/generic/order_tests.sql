
{% test order_values(model, column_name) %}

SELECT *
FROM {{ model }}
WHERE {{ column_name }} <= 880

{% endtest %}