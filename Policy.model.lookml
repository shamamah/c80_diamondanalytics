- connection: c00-demo

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
       
     - join: driver
       view_label: 'Driver'
       type: left_outer
       sql_on: ${policy_image.policy_id} = ${driver.policy_id} AND ${policy_image.policyimage_num} = ${driver.policyimage_num} AND ${driver.detailstatuscode_id} = 1
       relationship: one_to_many
       
     - join: driver_name_link
       type: inner
       sql_on: ${driver.policy_id} = ${driver_name_link.policy_id} AND ${driver.policyimage_num} = ${driver_name_link.policyimage_num} AND ${driver.driver_num} = ${driver_name_link.driver_num}
       relationship: one_to_many
       
     - join: driver_name
       type: inner
       sql_on: ${driver_name_link.name_id} = ${driver_name.name_id}
       relationship: one_to_one
       
     - join: driver_marital_status
       view_label: 'Driver'
       type: inner
       sql_on: ${driver_name.maritalstatus_id} = ${driver_marital_status.maritalstatus_id}
       relationship: one_to_one
       
     - join: driver_sex
       view_label: 'Driver'
       type: inner
       sql_on: ${driver_name.sex_id} = ${driver_sex.sex_id}
       relationship: one_to_one
      
     - join: driver_dln_state
       view_label: 'Driver'
       type: inner
       sql_on: ${driver_name.dlstate_id} = ${driver_dln_state.state_id}
       relationship: one_to_one 
