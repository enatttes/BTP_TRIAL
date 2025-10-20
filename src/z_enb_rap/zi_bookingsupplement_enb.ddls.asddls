@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement Interface projection enattesb'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_BookingSupplement_Enb
  as projection on ZR_BookingSupplement_Enb_TP
{
  key BooksupplUuid,
      TravelUuid,
      BookingUuid,
      BookingSupplementId,
      SupplementId,
      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookSupplPrice,
      CurrencyCode,
      
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      
      /* Associations */
      _Booking : redirected to parent ZI_Booking_enb,
      _Product,
      _SupplementText,
      _Travel  : redirected to ZI_Travel_Enb
}
