@EndUserText.label: 'REST Actions'
@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
define view entity ZI_ACF_SRGW_RestActions
  as select from zacf_srgwa_bc
  association to parent ZI_ACF_SRGW_RestActions_S as _RestActionsAll on $projection.SingletonID = _RestActionsAll.SingletonID
{
  key app                    as App,
  key code                   as Code,
      active                 as Active,
      description            as Description,
      tags                   as Tags,
      reponsible             as Reponsible,
      reference_info         as ReferenceInfo,
      action_type            as ActionType,
      action_destination     as ActionDestination,
      action_url             as ActionUrl,
      action_forward_app     as ActionForwardApp,
      action_forward_code    as ActionForwardCode,
      action_config          as ActionConfig,
      request_content_type   as RequestContentType,
      request_ddic_template  as RequestDdicTemplate,
      request_raw_template   as RequestRawTemplate,
      response_content_type  as ResponseContentType,
      response_ddic_template as ResponseDdicTemplate,
      response_raw_template  as ResponseRawTemplate,
      error_default_status   as ErrorDefaultStatus,
      error_default_message  as ErrorDefaultMessage,
      error_default_response as ErrorDefaultResponse,
      parameter_info         as ParameterInfo,
      parameter1             as Parameter1,
      parameter2             as Parameter2,
      parameter3             as Parameter3,
      parameter4             as Parameter4,
      parameter5             as Parameter5,
      @Semantics.user.createdBy: true
      created_by             as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at             as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by        as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at        as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      @Consumption.hidden: true
      local_last_changed_at  as LocalLastChangedAt,
      @Consumption.hidden: true
      1                      as SingletonID,
      _RestActionsAll

}
