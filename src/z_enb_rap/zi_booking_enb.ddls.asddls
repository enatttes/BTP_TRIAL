@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Interface Projection enattesb'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_Booking_enb
  as projection on ZR_BOOKING_ENB_TP
{
  key BookingUuid,
      TravelUuid,
      BookingId,
      BookingDate,
      CustomerId,
      AirlineId,
      ConnectionId,
      FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      BookingStatus,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,

      /* Associations */
      _BookingStatus,
      _BookingSupplement : redirected to composition child ZI_bookingSupplement_Enb,
      _Carrier,
      _Connection,
      _Customer,
      _Travel            : redirected to parent ZI_Travel_Enb
}
