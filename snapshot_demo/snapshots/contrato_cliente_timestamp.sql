{% snapshot contrato_cliente_timestamp_snapshot %}

    {{
        config(
            target_schema='snapshots',
            unique_key="id_cliente || '-' || id_contrato",

            strategy='timestamp',
            updated_at='updated_at'
        )
    }}

    SELECT *
    FROM {{ source('staging', 'contrato_cliente_timestamp') }}

{% endsnapshot %}
