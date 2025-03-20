@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption or Projection view for Employee child'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true

define view entity ZC_UD_EMPLOYEE
  as projection on ZI_UD_EMPLOYEE
{
  key EmployeeId,
      EmpRoot,
      FirstName,
      LastName,
      Department,
      JoiningDate,
      IsActive,
      ChangedBy,
      LocalLastChangedAt,
      ChangedAt,
      /* Associations */
      _remployee : redirected to parent ZC_UD_EMPROOT
}
