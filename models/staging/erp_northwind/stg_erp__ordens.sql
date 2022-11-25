with
    source_orders as (
        select
            cast(order_id as integer) as id_ordem
            , cast(customer_id as string) as id_cliente
            , cast(employee_id	as integer) as id_empregado			
            , cast(order_date as date) as data_ordem
            , cast(required_date as date) as data_requerida			
            , cast(shipped_date	as date) as data_entrega
            , cast(ship_via as integer) as id_transportadora
            , cast(freight as numeric) as frete
            , cast(ship_name as string) as nome_entrega
            , cast(ship_address as string) as endereco_entrega
            , cast(ship_city as string) as cidade_entrega
            , cast(ship_region as string) as regiao_entrega
            , cast(ship_postal_code as string) as codigo_postal_entrega
            , cast(ship_country as string) as pais_entrega
        from {{ source('erp', 'orders') }}
    )

select *
from source_orders