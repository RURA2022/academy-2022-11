with
    source_customers as (
        select
            cast(customer_id as string) as id_cliente
            , cast(company_name as string) as nome_cliente
            , cast(contact_name as string) as nome_contato
            , cast(contact_title as string) as titulo_contato
            , cast(address as string) as endereco
            , cast(city as string) as cidade
            , cast(region as string) as regiao
            , cast(postal_code as string) as codigo_postal
            , cast(country as string) as pais
            , cast(phone as string) as telefone
            , cast(fax as string) as fax
        from {{ source('erp', 'customers') }}
    )
select *
from source_customers