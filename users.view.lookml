- view: users
  sql_table_name: dbo.Users
  fields:

  - dimension: users_id
    primary_key: true
    hidden: true
    type: number
    sql: ${TABLE}.users_id

  - dimension: login_name
    label: 'Username'
    type: string
    sql: ${TABLE}.login_name

  - dimension: name_id
    type: number
    hidden: true
    sql: ${TABLE}.name_id

  - dimension: is_automated
    type: yesno
    sql: |
        CASE
          WHEN ${TABLE}.users_id = 'RHAdmin' THEN true
          WHEN ${TABLE}.users_id <> 'RHAdmin' THEN false
          ELSE false 
        END