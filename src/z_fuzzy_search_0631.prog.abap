*&---------------------------------------------------------------------*
*& Report z_fuzzy_search_0631
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_fuzzy_search_0631.

zcl_airlines_t100631=>get_airports(
      EXPORTING
        iv_airline_name = 'CAN'
        iv_threshold = '0.5'
      IMPORTING
        et_airlines     = DATA(lt_airlines) ).

CHECK NOT lt_airlines IS INITIAL.

cl_demo_output=>display( lt_airlines ).
