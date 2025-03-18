**********************************************************************
* Sample Executable Class to demonstrate execution of Custom Code,
* written in Class 'ZCL_PARALLEL_PROCESSING', in a parallel session
**********************************************************************
CLASS zcl_add_numbers DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_add_numbers IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "Create Instance for your Application Class that contains Custom Logic
    DATA(parallel_instance) = NEW zcl_parallel_processing(
      operand1_in = 10
      operand2_in = 20 ).

    "Pass the Instance of your Application Class to below Standard Method
    "This will execute the 'DO' Method of your Application Class in a parallel session
    NEW cl_abap_parallel( )->run_inst(
      EXPORTING
        p_in_tab  = VALUE #( ( parallel_instance )  )
      IMPORTING
        p_out_tab = DATA(parallel_output) ).

    IF parallel_output[ 1 ]-inst IS BOUND.
      "Call the GETTER Method Of your Application Class to receive output, if any
      DATA(result) = CAST zcl_parallel_processing( parallel_output[ 1 ]-inst )->get_export_data( ).

      out->write( EXPORTING data = result ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
