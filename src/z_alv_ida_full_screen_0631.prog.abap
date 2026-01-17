*&---------------------------------------------------------------------*
*& Report z_alv_ida_full_screen_0631
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_alv_ida_full_screen_0631.

TRY.

***** ALV instance
    DATA(go_salv) = cl_salv_gui_table_ida=>create(
                      iv_table_name         =  'SFLIGHT'  ).

****** Filter with conditions
    DATA(go_condition_factory) = go_salv->condition_factory( ).
    DATA(go_conditions) = go_condition_factory->equals(  name = 'CURRENCY' value = 'EUR'  )->or(
                          go_condition_factory->equals(  name = 'CURRENCY' value = 'USD'  )    ).

    go_salv->set_select_options( io_condition = go_conditions  ).

***** Display
    go_salv->fullscreen( )->display( ).

  CATCH cx_salv_db_connection INTO DATA(lx_db_connection).
    WRITE lx_db_connection->get_text(  ).
  CATCH cx_salv_db_table_not_supported INTO DATA(lx_db_table).
    WRITE lx_db_table->get_text(  ).
  CATCH cx_salv_ida_contract_violation INTO DATA(lx_db_contract).
    WRITE lx_db_contract->get_text(  ).
ENDTRY.
