@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Singleton root entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_UD_EMPROOT
  as select from    I_Language   as _language
    left outer join zud_employee as zemployee on 1 = 1
  composition [0..*] of ZI_UD_EMPLOYEE as _employee
{
      //Dummy field
  key 1                         as EmpRoot,
      max(zemployee.changed_at) as maxChangedat,
      _employee

}

where
  _language.Language = $session.system_language
