view: c57_claims_activity_detail {
  label: "Claims Activity Detail"
  derived_table: {
    sql:
      SELECT
          CN.display_name                                                     AS Company,
          S.statename                                                         AS [State],
          LOB.lobname                                                         AS LOB,
          PIM.agency_id                                                       AS AgencyCode,
          CC.claim_number                                                     AS ClaimNumber,
          CFE.claimant_num                                                    AS ClaimantNumber,
          CFE.claimfeature_num                                                AS ClaimFeatureNumber,
          CC.claim_number + ' - ' +
            CAST(CFE.claimant_num AS varchar) + ' - ' +
            CAST(CFE.claimfeature_num AS varchar)
                                                                              AS FeatureNumber,
          CovC.coveragecode                                                   AS CoverageCode,
          ASL.description                                                     AS CoverageType,
          CC.loss_date                                                        AS ClaimLossDate,
          DATENAME(YYYY,CC.loss_date) + 'Q' + DATENAME(QQ, CC.loss_date)      AS ClaimLossQuarter,
          CFE.added_date                                                      AS FeatureOpenDate,
          DATEDIFF(QQ, CC.loss_date, CFA.added_date) + 1                      AS ClaimActivityQuarter,
          CFA.added_date                                                      AS ClaimActivityDate,
          CAC.dscr                                                            AS ClaimActivityDescription,
          CFA.num                                                             AS ClaimActivityNumber,
          CC.claimcontrol_id
        FROM
                C57_Diamond.dbo.ClaimFeatureActivity              CFA   WITH (NOLOCK)
        LEFT OUTER JOIN ( SELECT
                  CFA2.claimcontrol_id,
                  CFA2.claimant_num,
                  CFA2.claimfeature_num,
            (SELECT   MIN(CFA3.num)
            FROM    C57_Diamond.dbo.ClaimFeatureActivity CFA3
            WHERE   CFA3.claimcontrol_id = CFA2.claimcontrol_id
              AND   CFA3.claimant_num = CFA2.claimant_num
              AND   CFA3.claimfeature_num = CFA2.claimfeature_num
              AND   CFA3.num > CFA2.num
              AND   CFA3.claimactivitycode_id IN (1, 2)
              AND   CFA3.claimactivitycode_id <> CFA2.claimactivitycode_id) AS min_num
          FROM      C57_Diamond.dbo.ClaimFeatureActivity CFA2
          WHERE     CFA2.claimactivitycode_id IN (1, 2)
        UNION
          SELECT
                  CFA2.claimcontrol_id,
                  CFA2.claimant_num,
                  CFA2.claimfeature_num,
                  MIN(CFA2.num) AS min_num
          FROM      C57_Diamond.dbo.ClaimFeatureActivity CFA2
          WHERE     CFA2.claimactivitycode_id IN (1, 2)
          GROUP BY    CFA2.claimcontrol_id,
                  CFA2.claimant_num,
                  CFA2.claimfeature_num)                  CFA2
          ON      CFA2.claimcontrol_id = CFA.claimcontrol_id
            AND   CFA2.claimant_num = CFA.claimant_num
            AND   CFA2.claimfeature_num = CFA.claimfeature_num
            AND   CFA2.min_num = CFA.num
        LEFT OUTER JOIN C57_Diamond.dbo.ClaimActivityCode               CAC   WITH (NOLOCK)
          ON      CAC.claimactivitycode_id = CFA.claimactivitycode_id
        LEFT OUTER JOIN C57_Diamond.dbo.ClaimFeature                  CFE   WITH (NOLOCK)
          ON      CFE.claimcontrol_id = CFA.claimcontrol_id
            AND   CFE.claimant_num = CFA.claimant_num
            AND   CFE.claimfeature_num = CFA.claimfeature_num
        LEFT OUTER JOIN C57_Diamond.dbo.ClaimCoverage                 ClmCov  WITH (NOLOCK)
          ON      CFE.claimcontrol_id = ClmCov.claimcontrol_id
            AND   CFE.claimexposure_id = ClmCov.claimexposure_id
            AND   CFE.claimsubexposure_num = ClmCov.claimsubexposure_num
            AND   CFE.claimcoverage_num = ClmCov.claimcoverage_num
        LEFT OUTER JOIN C57_Diamond.dbo.CoverageCode                  CovC  WITH (NOLOCK)
          ON      CovC.coveragecode_id = ClmCov.coveragecode_id
        LEFT OUTER JOIN C57_Diamond.dbo.ASL                       ASL   WITH (NOLOCK)
          ON      ASL.asl_id = ClmCov.asl_id
        LEFT OUTER JOIN C57_Diamond.dbo.ClaimControl                  CC    WITH (NOLOCK)
          ON      CC.claimcontrol_id = CFA.claimcontrol_id
        LEFT OUTER JOIN C57_Diamond.dbo.PolicyImage                   PIM   WITH (NOLOCK)
          ON      CC.policy_id = PIM.policy_id
            AND   CC.policyimage_num = PIM.policyimage_num
        LEFT OUTER JOIN C57_Diamond.dbo.Version                     V   WITH (NOLOCK)
          ON      PIM.version_id = V.version_id
        LEFT OUTER JOIN C57_Diamond.dbo.CompanyStateLOB                 CSL   WITH (NOLOCK)
          ON      V.companystatelob_id = CSL.companystatelob_id
        LEFT OUTER JOIN C57_Diamond.dbo.CompanyState                  CState  WITH (NOLOCK)
          ON      CSL.companystate_id = CState.companystate_id
        LEFT OUTER JOIN C57_Diamond.dbo.State                     S   WITH (NOLOCK)
          ON      CState.state_id = S.state_id
        LEFT OUTER JOIN C57_Diamond.dbo.Company                     C   WITH (NOLOCK)
          ON      CState.company_id = C.company_id
        LEFT OUTER JOIN C57_Diamond.dbo.CompanyLOB                    CLOB  WITH (NOLOCK)
          ON      CSL.companylob_id = CLOB.companylob_id
        LEFT OUTER JOIN C57_Diamond.dbo.LOB                       LOB   WITH (NOLOCK)
          ON      CLOB.lob_id = LOB.lob_id
        LEFT OUTER JOIN C57_Diamond.dbo.CompanyNameLink                 CNL   WITH (NOLOCK)
          ON      C.company_id = CNL.company_id
        LEFT OUTER JOIN C57_Diamond.dbo.Name                      CN    WITH (NOLOCK)
          ON      CNL.name_id = CN.name_id
        WHERE
                CFA.added_date between {% parameter start_date %} AND {% parameter end_date %}
          AND     CFA.claimactivitycode_id IN (1, 2)              -- Only return Open and Close activities
          AND     CFA2.claimant_num IS NOT NULL               -- Remove the non-changing values (duplicate Opens)
          AND     C.company_id = COALESCE(NULL, C.company_id)
          AND     CState.state_id = COALESCE(NULL, CState.state_id)
          AND     CLOB.lob_id = COALESCE(NULL, CLOB.lob_id)
       ;;
  }

  dimension: compound_primary_key {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${claimcontrol_id}, '  ', ${ClaimantNumber},'  ', ${ClaimFeatureNumber}) ;;
  }

  dimension: claimcontrol_id {
    type: string
    hidden: yes
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: company {
    type: string
    label: "Company"
    sql: ${TABLE}.company ;;
  }

  dimension: state {
    type: string
    label: "State"
    map_layer_name: us_states
    sql: ${TABLE}.state ;;
  }

  dimension: lob {
    type: string
    label: "LOB"
    sql: ${TABLE}.lob ;;
  }

  dimension: AgencyCode {
    type: string
    label: "Agency Code"
    sql: ${TABLE}.AgencyCode ;;
  }

  dimension: ClaimNumber {
    type: string
    label: "Claim Number"
    sql: ${TABLE}.ClaimNumber ;;
  }

  dimension: ClaimantNumber {
    type: number
    label: "Claimant Number"
    sql: ${TABLE}.ClaimantNumber ;;
  }

  dimension: ClaimFeatureNumber {
    type: number
    label: "Claim Feature Number"
    sql: ${TABLE}.ClaimFeatureNumber ;;
  }

  dimension: FeatureNumber {
    type: number
    label: "Feature Number"
    sql: ${TABLE}.FeatureNumber ;;
  }

  dimension: CoverageCode {
    type: string
    label: "Coverage Code"
    sql: ${TABLE}.CoverageCode ;;
  }

  dimension: CoverageType {
    type: string
    label: "Coverage Type"
    sql: ${TABLE}.CoverageType ;;
  }

  dimension: ClaimLossDate {
    label: "Claim Loss Date"
    type: date
    sql: ${TABLE}.ClaimLossDate ;;
  }

  dimension: ClaimLossQuarter {
    type: string
    label: "Claim Loss Quarter"
    sql: ${TABLE}.ClaimLossQuarter ;;
  }

  dimension: FeatureOpenDate {
    type: date
    label: "Feature Open Date"
    sql: ${TABLE}.FeatureOpenDate ;;
  }

  dimension: ClaimActivityQuarter {
    type: string
    label: "Claim Activity Quarter"
    sql: ${TABLE}.ClaimActivityQuarter ;;
  }

  dimension: ClaimActivityDate {
    type: date
    label: "Claim Activity Date"
    sql: ${TABLE}.ClaimActivityDate ;;
  }

  dimension: ClaimActivityDescription {
    type: string
    label: "Claim Activity Description"
    sql: ${TABLE}.ClaimActivityDescription ;;
  }

  dimension: ClaimActivityNumber {
    type: string
    label: "Claim Actvity Number"
    sql: ${TABLE}.ClaimActivityNumber ;;
  }

  measure: count {
    type: count
  }

  filter: start_date {
    type: string
  }

  filter: end_date {
    type: string
  }

}
