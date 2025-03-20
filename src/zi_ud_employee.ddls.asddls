@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface or cds view for Employee Data'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_UD_EMPLOYEE
  as select from zud_employee
  association to parent ZI_UD_EMPROOT as _remployee on $projection.EmpRoot = _remployee.EmpRoot
{
  key employee_id           as EmployeeId,
      1                     as EmpRoot,
      first_name            as FirstName,
      last_name             as LastName,
      department            as Department,
      joining_date          as JoiningDate,
      is_active             as IsActive,
      @Semantics.user.lastChangedBy: true
      changed_by            as ChangedBy,
      //Etag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      //Total etag
      @Semantics.systemDateTime.lastChangedAt: true
      changed_at            as ChangedAt,
      _remployee
}
