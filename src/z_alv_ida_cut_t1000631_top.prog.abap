*&---------------------------------------------------------------------*
*& Include Z_ALV_IDA_CUT_T1000631_TOP               - Report Z_ALV_IDA_CUT_T1000631
*&---------------------------------------------------------------------*
DATA gs_scustom TYPE scustom.


SELECT-OPTIONS so_langu FOR gs_scustom-langu.

"---- Objetos globales del ALV IDA

DATA: go_alv_display TYPE REF TO if_salv_gui_table_ida,
      go_cust_cont   TYPE REF TO cl_gui_custom_container.
