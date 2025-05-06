@EndUserText.label: 'REST Actions Singleton'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.semanticKey: [ 'SingletonID' ]
@UI: {
  headerInfo: {
    typeName: 'RestActionsAll'
  }
}
define root view entity ZI_ACF_SRGW_RestActions_S
  as select from I_Language
    left outer join ZACF_SRGWA_BC on 0 = 0
  association [0..*] to I_ABAPTransportRequestText as _ABAPTransportRequestText on $projection.TransportRequestID = _ABAPTransportRequestText.TransportRequestID
  composition [0..*] of ZI_ACF_SRGW_RestActions as _RestActions
{
  @UI.facet: [ {
    id: 'ZI_ACF_SRGW_RestActions', 
    purpose: #STANDARD, 
    type: #LINEITEM_REFERENCE, 
    label: 'REST Actions', 
    position: 1 , 
    targetElement: '_RestActions'
  } ]
  @UI.lineItem: [ {
    position: 1 
  } ]
  key 1 as SingletonID,
  _RestActions,
  @UI.hidden: true
  max( ZACF_SRGWA_BC.LAST_CHANGED_AT ) as LastChangedAtMax,
  @ObjectModel.text.association: '_ABAPTransportRequestText'
  @UI.identification: [ {
    position: 2 , 
    type: #WITH_INTENT_BASED_NAVIGATION, 
    semanticObjectAction: 'manage'
  } ]
  @Consumption.semanticObject: 'CustomizingTransport'
  cast( '' as SXCO_TRANSPORT) as TransportRequestID,
  _ABAPTransportRequestText
  
}
where I_Language.Language = $session.system_language
