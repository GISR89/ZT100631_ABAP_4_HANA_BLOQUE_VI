*&---------------------------------------------------------------------*
*& Include z_alv_ida_cut_t1000631_i01
*&---------------------------------------------------------------------*

MODULE user_command_2000 INPUT.

  CASE sy-ucomm.

    WHEN 'BACK'.
      IF go_alv_display IS BOUND.
        go_alv_display->free(  ).
      ENDIF.
      LEAVE TO SCREEN 0.
    WHEN OTHERS.
  ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_EXIT_2000  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_exit_2000 INPUT.

  CASE sy-ucomm.
    WHEN 'EXIT'.
      IF go_alv_display IS BOUND.
        go_alv_display->free(  ).
      ENDIF.
      LEAVE TO SCREEN 0.
    WHEN OTHERS.
  ENDCASE.

ENDMODULE.
