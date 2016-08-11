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

     - join: transaction_reason
       view_label: 'Policy Image'
       type: inner
       sql_on: ${policy_image.transreason_id} = ${transaction_reason.transreason_id}
       relationship: one_to_one

     - join: transaction_type
       view_label: 'Policy Image'
       type: inner
       sql_on: ${policy_image.transtype_id} = ${transaction_type.transtype_id}
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
       sql_on: ${policy_holder_policy_image_name_link.policy_id} = ${policy_image.policy_id} AND ${policy_holder_policy_image_name_link.policyimage_num} = ${policy_image.policyimage_num} AND ${policy_holder_policy_image_name_link.nameaddresssource_id} = 3
       relationship: one_to_one

     - join: policy_holder_name
       type: inner
       sql_on: ${policy_holder_name.name_id} = ${policy_holder_policy_image_name_link.name_id}
       relationship: one_to_one

     - join: policy_holder_marital_status
       view_label: 'Policy Holder'
       type: inner
       sql_on: ${policy_holder_marital_status.maritalstatus_id} = ${policy_holder_name.maritalstatus_id}
       relationship: one_to_one
       
     - join: policy_holder_sex
       view_label: 'Policy Holder'
       type: inner
       sql_on: ${policy_holder_sex.sex_id} = ${policy_holder_name.sex_id}
       relationship: one_to_one
