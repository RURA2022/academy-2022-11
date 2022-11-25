with
    source_employees as (
        select
            cast(employee_id as integer) as id_empregado
            , cast(last_name as string) as sobrenome
            , cast(first_name as string) as nome
            , cast(title as string) as cargo
            , cast(title_of_courtesy as string) as titulo
            , cast(birth_date as date) as data_nascimento
            , cast(hire_date as date) as data_contratacao
            , cast(address as string) as endereco
            , cast(city as string) as cidade
            , cast(region as string) as regiao 
            , cast(postal_code as string) as codigo_postal
            , cast(country as string) as pais 
            , cast(home_phone as string) as telefone_residencial
            , cast(extension as integer) as ramal
            --, cast(photo as string) as foto
            --, cast(notes as string) as notas
            , cast(reports_to as integer) as superior_imediato 
            --, cast(photo_path as string) as caminho_foto
        from {{ source('erp', 'employees') }}
    )
select *
from source_employees