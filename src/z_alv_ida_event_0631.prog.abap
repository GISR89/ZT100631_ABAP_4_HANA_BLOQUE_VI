*&---------------------------------------------------------------------*
*& Report z_alv_ida_event_0631
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_alv_ida_event_0631.

CLASS lcl_handle_salv_ida DEFINITION.

  PUBLIC SECTION.

    METHODS on_double_click FOR EVENT double_click OF if_salv_gui_table_display_opt
      IMPORTING ev_field_name
                eo_row_data.

ENDCLASS.

CLASS lcl_handle_salv_ida IMPLEMENTATION.

  METHOD on_double_click.

    DATA ls_flight TYPE sflight.

    CHECK ev_field_name = 'CARRID'.

    TRY.
        eo_row_data->get_row_data(
          EXPORTING
            iv_request_type      = if_salv_gui_selection_ida=>cs_request_type-all_fields
*    its_requested_fields =
          IMPORTING
            es_row               = ls_flight ).

      CATCH cx_salv_ida_contract_violation.
      CATCH cx_salv_ida_sel_row_deleted.

    ENDTRY.

****Display the row data
    cl_salv_ida_show_data_row=>display( iv_text = 'Flight Info'
                                        is_data = ls_flight ).

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

***** ALV instance
  DATA(go_salv) = cl_salv_gui_table_ida=>create(
                    iv_table_name         =  'SFLIGHT'  ).

******* habilita evento
  go_salv->display_options( )->enable_double_click( ).

  DATA(go_event_handler) = NEW lcl_handle_salv_ida( ).
  SET HANDLER go_event_handler->on_double_click FOR go_salv->display_options( ).

  go_salv->fullscreen( )->display( ).
