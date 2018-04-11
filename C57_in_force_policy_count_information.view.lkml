view: c57_in_force_policy_count_information {
  label: "In Force Policy Count and Premium Information"
  derived_table: {
    sql:
        SELECT
             IFPCI.State                                          AS State
            ,IFPCI.Territory                                      AS Territory
            ,LEFT(COALESCE(VGA.zip, VMA.zip), 5)                  AS ZipCode
            ,sum(c.premium_written)                               AS InforcePremium
            ,count(distinct (IFPCI.policyid))                     AS PolicyCount
            ,IFPCI.policyid
        FROM C57_Diamond.dbo.vC57_Looker_InForceVehicleCountInformation({% parameter if_date %}) IFPCI
        INNER JOIN C57_Diamond.dbo.coverage C with(nolock)
          on IFPCI.PolicyID = C.policy_id
            and IFPCI.policyimagenum = c.policyimage_num
        INNER JOIN CoverageCode CC (nolock)
          on CC.coveragecode_id = CC.coveragecode_id
        LEFT JOIN C57_Diamond.dbo.Address            VGA(NOLOCK)
          ON VGA.policy_id = IFPCI.policyid
            AND VGA.policyimage_num = IFPCI.policyimagenum
            AND VGA.address_num = C.unit_num
            AND VGA.detailstatuscode_id = 1
            AND VGA.zip <> '00000-0000'
            AND VGA.nameaddresssource_id = 17 -- Garage Address
        LEFT JOIN C57_Diamond.dbo.Address            VMA(NOLOCK)
          ON VMA.policy_id = IFPCI.PolicyId
            AND VMA.policyimage_num = IFPCI.policyimagenum
            AND VMA.detailstatuscode_id = 1
            AND VMA.zip <> '00000-0000'
            AND VMA.nameaddresssource_id = 3 -- Policy Holder #1
      where 1= 1
      and c.coveragecode_id NOT in (90000, 90001, 80037)        -- No ABTPA Fee or Agency Fee
      --and c.coveragecode_id = 3               --  COMP Coverage
      and c.detailstatuscode_id = 1
        GROUP BY
             IFPCI.State
            ,IFPCI.Territory
            ,LEFT(COALESCE(VGA.zip, VMA.zip), 5)
            ,IFPCI.policyid
       ;;
  }

  dimension: policyid {
    type: string
    primary_key: yes
    hidden:  yes
    sql: ${TABLE}.policyid ;;
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

  measure: InforcePremium {
    type: sum
    value_format_name: usd
    label: "In-Force Premium"
    sql: ${TABLE}.InforcePremium ;;
  }

  measure: PolicyCount {
    type: sum
    label: "Policy Count"
    sql: ${TABLE}.PolicyCount ;;
  }

  filter: if_date {
    type: string
    label: "In-Force Date"
  }

}
