**********************************************************************
* Application Class with Custom Logic
**********************************************************************
CLASS zcl_parallel_processing DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_abap_parallel.

    METHODS constructor
      IMPORTING operand1_in TYPE i
                operand2_in TYPE i.

    METHODS get_export_data
      RETURNING VALUE(result_out) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA operand1 TYPE i.
    DATA operand2 TYPE i.
    DATA result   TYPE i.
ENDCLASS.


CLASS zcl_parallel_processing IMPLEMENTATION.

  METHOD if_abap_parallel~do.
    "This method should contain the main custom execution logic and will get triggered in a parallel session
    "RAP restricted statements like COMMIT, SUBMIT, etc can be written in this Method
    me->result = me->operand1 + me->operand2.
  ENDMETHOD.


  METHOD constructor.
    me->operand1 = operand1_in.
    me->operand2 = operand2_in.
  ENDMETHOD.


  METHOD get_export_data.
    "This GETTER method should be implemented if something needs to be returned to the caller
    result_out = me->result.
  ENDMETHOD.
ENDCLASS.
