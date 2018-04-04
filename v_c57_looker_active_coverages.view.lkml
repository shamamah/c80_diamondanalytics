view: v_c57_looker_active_coverages {
  sql_table_name: dbo.vC57_Looker_ActiveCoverages ;;

  dimension: coveragecode_id {
    type: number
    hidden: yes
    sql: ${TABLE}.coveragecode_id ;;
  }

  dimension: dscr {
    label: "Coverage Description"
    type: string
    sql: ${TABLE}.dscr ;;
  }

}
