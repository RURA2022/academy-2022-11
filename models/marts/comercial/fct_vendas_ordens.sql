with
    source_orders as (
        select *            
        from {{ ref('stg_erp__ordens') }}
    ),
    source_order_details as (
        select *
        from {{ ref('stg_erp__ordens_itens') }}
    ),
    source_order_details_join as (
        select 
            o.id_ordem
            , o.id_cliente
            , o.id_empregado			
            , o.data_ordem
            , o.data_requerida			
            , o.data_entrega
            , o.id_transportadora
            , o.frete
            , o.nome_entrega
            , o.endereco_entrega
            , o.cidade_entrega
            , o.regiao_entrega
            , o.codigo_postal_entrega
            , o.pais_entrega
            , d.id_produto
            , d.preco_por_unidade
            , d.quantidade
            , d.desconto
        from source_orders as o
        inner join source_order_details as d on o.id_ordem = d.id_ordem
        order by o.id_ordem, 
                 d.id_produto
    )
select ROW_NUMBER() OVER() as surrogatekey
        ,*
from source_order_details_join


--faltou criar as dimensoes e as surrogate keys


