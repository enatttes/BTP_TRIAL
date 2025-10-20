@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement enattesb'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZR_BookingSupplement_Enb_TP
  as select from ztb_booksup_en
  association        to parent ZR_Booking_Enb_TP as _Booking        on $projection.BookingUuid = _Booking.BookingUuid

  association [1..1] to ZR_Travel_Enb_TP         as _Travel         on $projection.TravelUuid = _Travel.TravelUuid
  association [1..1] to /DMO/I_Supplement        as _Product        on $projection.SupplementId = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText    as _SupplementText on $projection.SupplementId = _SupplementText.SupplementID
{
  key booksuppl_uuid        as BooksupplUuid,
      root_uuid             as TravelUuid,
      parent_uuid           as BookingUuid,
      booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as BookSupplPrice,
      currency_code         as CurrencyCode,
      
      //local ETag field --> OData ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      
      //Asocciations
      _Booking, 
      _Travel,        
      _Product,       
      _SupplementText
}
