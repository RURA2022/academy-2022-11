with
    source_order_details as (
        select
            cast(order_id as integer) as id_ordem
            , cast(product_id as integer) as id_produto
            , cast(unit_price as numeric) as preco_por_unidade
            , cast(quantity as integer) as quantidade
            , cast(discount as numeric) as desconto
        from {{ source('erp', 'order_details') }}
    )
select *
from source_order_details