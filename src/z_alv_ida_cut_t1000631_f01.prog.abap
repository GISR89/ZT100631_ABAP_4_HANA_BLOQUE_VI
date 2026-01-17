*&---------------------------------------------------------------------*
*& Include z_alv_ida_cut_t1000631_f01
*&---------------------------------------------------------------------*

FORM init_2000.

  IF go_cust_cont IS NOT BOUND.

    go_cust_cont = NEW #(  'CONT_ALV'  ).

    TRY.

        go_alv_display = cl_salv_gui_table_ida=>create(
          EXPORTING
            iv_table_name         = 'SCUSTOM'
           io_gui_container      = go_cust_cont ).

      CATCH cx_salv_db_connection INTO DATA(lo_db_connection).
      CATCH cx_salv_db_table_not_supported.
      CATCH cx_salv_ida_contract_violation.

    ENDTRY.

    PERFORM apply_filter.

  ENDIF.

ENDFORM.

FORM apply_filter.

  TRY.

      DATA(go_collector) = NEW cl_salv_range_tab_collector( ).

      go_collector->add_ranges_for_name(
        EXPORTING
          iv_name   = 'LANGU'
          it_ranges = so_langu[] ).

      go_collector->get_collected_ranges(  IMPORTING et_named_ranges = DATA(gt_named_ranges) ).

      go_alv_display->set_select_options(
        EXPORTING
          it_ranges    = gt_named_ranges

      ).
    CATCH cx_salv_ida_associate_invalid.
    CATCH cx_salv_db_connection.
    CATCH cx_salv_ida_condition_invalid.
    CATCH cx_salv_ida_unknown_name.
  ENDTRY.

ENDFORM.
