CLASS zud_cl_employee DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zud_cl_employee IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA: lt_employee TYPE STANDARD TABLE OF zud_employee.

    TRY.
        lt_employee = VALUE #( ( employee_id = '1'
                                 first_name = 'Uday'
                                 last_name = 'Kiran'
                                 department = 'IT'
                                 joining_date = '20220101'
                                 is_active = 'X'
                                 changed_by = 'ADMIN' )

                               ( employee_id = '2'
                                 first_name = 'Narendra'
                                 last_name = 'Reddy'
                                 department = 'IT'
                                 joining_date = '20220315'
                                 is_active = 'X'
                                 changed_by = 'ADMIN' )

                               ( employee_id = '3'
                                 first_name = 'Ravi'
                                 last_name = 'Nandan'
                                 department = 'IT'
                                 joining_date = '20210420'
                                 is_active = 'X'
                                 changed_by = 'ADMIN' ) ).

        DELETE FROM zud_employee.
        INSERT zud_employee FROM TABLE @lt_employee.
        out->write( |{ sy-dbcnt } entries in Zud_employee modified| ).
        COMMIT WORK.

      CATCH cx_uuid_error.
        out->write( |Error generating record| ).

       ENDTRY.
  ENDMETHOD.
ENDCLASS.
