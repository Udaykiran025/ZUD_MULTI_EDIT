@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption or Projection View for root  view Employee'
@Metadata.ignorePropagatedAnnotations: true

@UI.headerInfo: {
typeName: 'Manage Employee',
typeNamePlural: 'Employee Singleton',
title: {
type: #STANDARD,
value: 'EmpRoot'
//targetElement: '_employee'
} }
define root view entity ZC_UD_EMPROOT
  as projection on ZI_UD_EMPROOT
{
      @UI.facet: [{
      purpose: #STANDARD             ,
      position: 10,
      label: 'Employee Multil inline Edit',
      type: #LINEITEM_REFERENCE,
      targetElement: '_employee'
      }]

      @UI.lineItem: [{ position: 10 }]
  key EmpRoot,
      maxChangedat,

      /* Associations */
      _employee : redirected to composition child ZC_UD_EMPLOYEE
}
