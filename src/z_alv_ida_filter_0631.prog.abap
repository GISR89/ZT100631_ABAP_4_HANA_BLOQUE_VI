*&---------------------------------------------------------------------*
*& Report z_alv_ida_filter_0631
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_alv_ida_filter_0631.

START-OF-SELECTION.

PARAMETERS: p_carrid TYPE s_carr_id,
            p_connid TYPE s_conn_id.

DATA gs_flight TYPE sflight.

SELECT-OPTIONS so_seats FOR gs_flight-seatsocc.
SELECT-OPTIONS so_smaxb FOR gs_flight-seatsmax_b.

TRY.

***** ALV instance
    DATA(go_salv) = cl_salv_gui_table_ida=>create_for_cds_view(
                      iv_cds_view_name      = 'ZCDS_SFLIGHT_0631' ).

*** CDS Parameters
    go_salv->set_view_parameters( it_parameters = VALUE #( (  name = 'p_Carrid' value = p_carrid )
                                                           (  name = 'p_Connid' value = p_connid ) ) )  .

******* Filters
    DATA(go_collector) = NEW cl_salv_range_tab_collector( ).

    go_collector->add_ranges_for_name( iv_name = 'SEATSOCC'
                                       it_ranges = so_seats[] ).

    go_collector->add_ranges_for_name( iv_name = 'SEATSMAXB'
                                       it_ranges = so_smaxb[] ).

    go_collector->get_collected_ranges( IMPORTING et_named_ranges = DATA(gt_named_ranges) ).

    go_salv->set_select_options( it_ranges = gt_named_ranges ).

***** Display
    go_salv->fullscreen( )->display( ).

  CATCH cx_salv_db_connection INTO DATA(lx_db_connection).
    WRITE lx_db_connection->get_text(  ).
  CATCH cx_salv_db_table_not_supported INTO DATA(lx_db_table).
    WRITE lx_db_table->get_text(  ).
  CATCH cx_salv_ida_contract_violation INTO DATA(lx_db_contract).
    WRITE lx_db_contract->get_text(  ).
ENDTRY.
