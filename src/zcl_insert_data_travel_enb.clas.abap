CLASS zcl_insert_data_travel_enb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    TYPES:
      tt_travel   TYPE STANDARD TABLE OF ztb_travel_en WITH EMPTY KEY,
      tt_booking  TYPE STANDARD TABLE OF ztb_booking_en WITH EMPTY KEY,
      tt_book_sup TYPE STANDARD TABLE OF ztb_booksup_en WITH EMPTY KEY.
ENDCLASS.



CLASS zcl_insert_data_travel_enb IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA(lt_travel) = VALUE tt_travel( ).
    SELECT
      FROM /dmo/a_travel_d
    FIELDS travel_uuid,
           travel_id,
           agency_id,
           customer_id,
           begin_date,
           end_date,
           booking_fee,
           total_price,
           currency_code,
           description,
           overall_status,
           local_created_by,
           local_created_at,
           local_last_changed_by,
           local_last_changed_at,
           last_changed_at
      INTO CORRESPONDING FIELDS OF TABLE @lt_travel
      UP TO 113 ROWS.

    DATA(lt_booking) = VALUE tt_booking(  ).
    SELECT * FROM /dmo/a_booking_d
      FOR ALL ENTRIES IN @lt_travel
      WHERE parent_uuid = @lt_travel-travel_uuid
      INTO CORRESPONDING FIELDS OF TABLE @lt_booking.

    DATA(lt_book_sup) = VALUE tt_book_sup(  ).
    SELECT * FROM /dmo/a_bksuppl_d
      FOR ALL ENTRIES IN @lt_booking
      WHERE root_uuid  = @lt_booking-parent_uuid
        AND parent_uuid = @lt_booking-booking_uuid
      INTO CORRESPONDING FIELDS OF TABLE @lt_book_sup.

    DELETE FROM ztb_travel_en.
    DELETE FROM ztb_booking_en.
    DELETE FROM ztb_booksup_en.
    INSERT: ztb_travel_en  FROM TABLE @lt_travel,
            ztb_booking_en FROM TABLE @lt_booking,
            ztb_booksup_en FROM TABLE @lt_book_sup.
    out->write( 'Registros inseertados correctamente' ).
  ENDMETHOD.
ENDCLASS.
