{% snapshot contrato_cliente_check_snapshot %}

    {{
        config(
            target_schema='snapshots',
            unique_key="id_cliente||'-'||id_contrato",

            strategy='check',
            check_cols=['detalles_contrato']
        )
    }}

    SELECT *
    FROM {{ source('staging', 'contrato_cliente_check') }}

{% endsnapshot %}
