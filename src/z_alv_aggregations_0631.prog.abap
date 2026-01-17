*&---------------------------------------------------------------------*
*& Report z_alv_aggregations_0631
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_alv_aggregations_0631.

TRY.

***** ALV instance
    DATA(go_salv) = cl_salv_gui_table_ida=>create(
                      iv_table_name         =  'SFLIGHT'  ).

***** Aggregations
    go_salv->default_layout( )->set_aggregations( it_aggregations = VALUE #( ( field_name = 'SEATSMAX'
                                                                               function   = if_salv_service_types=>cs_function_code-sum ) ) ).

***** Ordering
go_salv->default_layout( )->set_sort_order( it_sort_order = value #( ( field_name = 'SEATSOCC'
                                                                       descending = abap_off ) ) ).

***** Display
    go_salv->fullscreen( )->display( ).

  CATCH cx_salv_db_connection INTO DATA(lx_db_connection).
    WRITE lx_db_connection->get_text(  ).
  CATCH cx_salv_db_table_not_supported INTO DATA(lx_db_table).
    WRITE lx_db_table->get_text(  ).
  CATCH cx_salv_ida_contract_violation INTO DATA(lx_db_contract).
    WRITE lx_db_contract->get_text(  ).
ENDTRY.
