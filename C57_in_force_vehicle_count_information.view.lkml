view: c57_in_force_vehicle_count_information {
  label: "In-Force Vehicle Count Information"
  derived_table: {
    sql:
        SELECT
             IFVCI.State                                          AS State
            ,IFVCI.Territory                                      AS Territory
            ,LEFT(COALESCE(VGA.zip, VMA.zip), 5)                  AS ZipCode
            ,cc.dscr                                              AS CoverageDescription
            ,sum(c.premium_written)                               AS InforcePremium
            ,count(distinct (
                           convert(varchar,IFVCI.policyid) +
                           convert(varchar,IFVCI.policyimagenum) +
                           convert (varchar,c.unit_num)
                           ))                                     AS VehicleCount
            ,CC.coveragecode_id
            ,IFVCI.policyid
            ,IFVCI.policyimagenum
            ,c.unit_num
        FROM Diamond.dbo.vC57_Looker_InForceVehicleCountInformation({% parameter if_date %}) IFVCI
        INNER JOIN Diamond.dbo.coverage C with(nolock)
          on IFVCI.PolicyID = C.policy_id
            and IFVCI.policyimagenum = c.policyimage_num
        INNER JOIN CoverageCode CC (nolock)
          on CC.coveragecode_id = CC.coveragecode_id
        LEFT JOIN Diamond.dbo.Address            VGA(NOLOCK)
          ON VGA.policy_id = IFVCI.policyid
            AND VGA.policyimage_num = IFVCI.policyimagenum
            AND VGA.address_num = C.unit_num
            AND VGA.detailstatuscode_id = 1
            AND VGA.zip <> '00000-0000'
            AND VGA.nameaddresssource_id = 17 -- Garage Address
        LEFT JOIN Diamond.dbo.Address            VMA(NOLOCK)
          ON VMA.policy_id = IFVCI.PolicyId
            AND VMA.policyimage_num = IFVCI.policyimagenum
            AND VMA.detailstatuscode_id = 1
            AND VMA.zip <> '00000-0000'
            AND VMA.nameaddresssource_id = 3 -- Policy Holder #1
      where 1= 1
      and c.coveragecode_id NOT in (90000, 90001, 80037)        -- No ABTPA Fee or Agency Fee
      --and c.coveragecode_id = 3               --  COMP Coverage
      and c.detailstatuscode_id = 1
        GROUP BY
             IFVCI.State
            ,IFVCI.Territory
            ,LEFT(COALESCE(VGA.zip, VMA.zip), 5)
            ,CC.dscr
            ,CC.coveragecode_id
            ,IFVCI.policyid
            ,IFVCI.policyimagenum
            ,c.unit_num
       ;;
  }

  dimension: compound_primary_key {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${policyid}, '  ', ${policyimagenum},'  ', ${unit_num}) ;;
  }

  dimension: policyid {
    type: string
    hidden:  yes
    sql: ${TABLE}.policyid ;;
  }

  dimension: policyimagenum {
    type: string
    hidden:  yes
    sql: ${TABLE}.policyimagenum ;;
  }

  dimension: unit_num {
    type: string
    hidden:  yes
    sql: ${TABLE}.unit_num ;;
  }

  dimension: state {
    type: string
    label: "State"
    map_layer_name: us_states
    sql: ${TABLE}.state ;;
  }

  dimension: territory {
    type: string
    label: "Territory"
    sql: ${TABLE}.territory ;;
  }

  dimension: ZipCode {
    type: zipcode
    label: "Zip Code"
    sql: ${TABLE}.ZipCode ;;
  }

  dimension: coveragecode_id {
    type: number
    hidden: yes
    label: "Coverage Description"
    sql: ${TABLE}.coveragecode_id ;;
  }

  measure: InforcePremium {
    type:  sum_distinct
    value_format_name: usd
    label: "In-Force Premium"
    sql: ${TABLE}.InforcePremium ;;
  }

  measure: VehicleCount {
    type: sum
    label: "Vehicle Count"
    sql: ${TABLE}.VehicleCount ;;
  }

  parameter: if_date {
    type: date
    label: "In-Force Date"
  }

}
