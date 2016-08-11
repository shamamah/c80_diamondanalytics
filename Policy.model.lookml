- connection: c00-demo

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: policy
  joins:
     - join: policy_image
       type: inner
       sql_on: ${policy.policy_id} = ${policy_image.policy_id}
       relationship: one_to_many
       
     - join: current_status
       type: inner
       sql_on: ${policy.policycurrentstatus_id} = ${current_status.policycurrentstatus_id}
       relationship: one_to_one

     - join: transaction_reason
       view_label: 'Policy Image'
       type: inner
       sql_on: ${policy_image.transreason_id} = ${transaction_reason.transreason_id}
       relationship: one_to_one

     - join: transaction_type
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

