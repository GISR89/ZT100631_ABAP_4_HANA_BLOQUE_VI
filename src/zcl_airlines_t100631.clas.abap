CLASS zcl_airlines_t100631 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES ty_threshold TYPE p LENGTH 3 DECIMALS 1.

    INTERFACES: if_amdp_marker_hdb, if_oo_adt_classrun .

    CLASS-METHODS get_airports IMPORTING VALUE(iv_airline_name) TYPE s_carrname
                                         VALUE(iv_threshold)    TYPE ty_threshold
                               EXPORTING VALUE(et_airlines)     TYPE ty_scarr.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_airlines_t100631 IMPLEMENTATION.
  METHOD get_airports BY DATABASE PROCEDURE FOR HDB
                      LANGUAGE SQLSCRIPT
                      OPTIONS READ-ONLY
                      USING scarr.

    et_airlines = select * from scarr
                  where contaINS ( carrname , :iv_airline_name, fuZZY( :iv_threshold) );


  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.

    zcl_airlines_t100631=>get_airports(
      EXPORTING
        iv_airline_name = 'CAN'
        iv_threshold = '0.5'
      IMPORTING
        et_airlines     = DATA(lt_airlines) ).

    out->write( lt_airlines ).

  ENDMETHOD.

ENDCLASS.
