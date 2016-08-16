- connection: c63-test-cea

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards
-
- explore: policy
  joins:
     - join: policy_image
       type: inner
       sql_on: ${policy.policy_id} = ${policy_image.policy_id}
       relationship: one_to_many
       
     - join: current_status
       view_label: 'Policy'
       type: inner
       sql_on: ${policy.policycurrentstatus_id} = ${current_status.policycurrentstatus_id}
       relationship: one_to_one

     - join: policy_image_trans_reason
       view_label: 'Policy Image'
       type: inner
       sql_on: ${policy_image.transreason_id} = ${policy_image_trans_reason.transreason_id}
       relationship: one_to_one

     - join: policy_image_trans_type
       view_label: 'Policy Image'
       type: inner
       sql_on: ${policy_image.transtype_id} = ${policy_image_trans_type.transtype_id}
       relationship: one_to_one
       
     - join: version
       type: inner
       sql_on: ${policy_image.version_id} = ${version.version_id}
       relationship: many_to_one
       
     - join: company_state_lob
       type: inner
       sql_on: ${version.companystatelob_id} = ${company_state_lob.companystatelob_id}
       relationship: one_to_one
       
     - join: policy_holder_policy_image_name_link
       type: inner
       sql_on: ${policy_image.policy_id} = ${policy_holder_policy_image_name_link.policy_id} AND ${policy_image.policyimage_num} = ${policy_holder_policy_image_name_link.policyimage_num} AND ${policy_holder_policy_image_name_link.nameaddresssource_id} = 3
       relationship: one_to_many

     - join: policy_holder_name
       type: inner
       sql_on: ${policy_holder_policy_image_name_link.name_id} = ${policy_holder_name.name_id} AND ${policy_holder_name.detailstatuscode_id} = 1
       relationship: one_to_one

     - join: policy_holder_marital_status
       view_label: 'Policy Holder'
       type: inner
       sql_on: ${policy_holder_name.maritalstatus_id} = ${policy_holder_marital_status.maritalstatus_id}
       relationship: one_to_one
       
     - join: policy_holder_sex
       view_label: 'Policy Holder'
       type: inner
       sql_on: ${policy_holder_name.sex_id} = ${policy_holder_sex.sex_id}
       relationship: one_to_one
       
     - join: location
       view_label: 'Location'
       type: left_outer
       sql_on: ${policy_image.policy_id} = ${location.policy_id} AND ${policy_image.policyimage_num} = ${location.policyimage_num} AND ${location.detailstatuscode_id} = 1
       relationship: one_to_many
       
    # - join: location_name_link
    #   type: inner
    #   sql_on: ${location.policy_id} = ${location_name_link.policy_id} AND ${location.policyimage_num} = ${location_name_link.policyimage_num} AND ${location.location_num} = ${location_name_link.location_num}
    #   relationship: one_to_many
       
    # - join: location_name
    #   type: inner
    #   sql_on: ${location_name_link.name_id} = ${location_name.name_id}
    #   relationship: one_to_one
       
     - join: location_address_link
       type: inner
       sql_on: ${location.policy_id} = ${location_address_link.policy_id} AND ${location.policyimage_num} = ${location_address_link.policyimage_num} AND ${location.location_num} = ${location_address_link.location_num}
       relationship: one_to_many
       
     - join: location_address
       view_label: 'Location'
       type: inner
       sql_on: ${location_address_link.address_id} = ${location_address.address_id}
       relationship: one_to_one
       
     - join: coverage
       view_label: 'Coverage'
       type: left_outer
       sql_on: ${policy_image.policy_id} = ${coverage.policy_id} AND ${policy_image.policyimage_num} = ${coverage.policyimage_num} AND ${location.location_num} = ${coverage.unit_num} AND ${coverage.detailstatuscode_id} = 1
       relationship: one_to_many
       
     - join: coverage_code
       view_label: 'Coverage'
       type: inner
       sql_on: ${coverage.coveragecode_id} = ${coverage_code.coveragecode_id}
       relationship: one_to_one
       
     - join: coverage_limit
       view_label: 'Coverage'
       type: inner
       sql_on: ${coverage.coveragelimit_id} = ${coverage_limit.coveragelimit_id}
       relationship: one_to_one
     

  
