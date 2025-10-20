@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Interface Projection enattesb'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_Travel_Enb 
provider contract transactional_interface
  as projection on ZR_Travel_Enb_TP
{
    key TravelUuid,
    TravelId,
    AgencyId,
    CustomerId,
    BeginDate,
    EndDate,
    
    @Semantics.amount.currencyCode: 'CurrencyCode'
    BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    TotalPrice,
    CurrencyCode,
    Description,
    
    OverallStatus,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _Agency,
    _Booking : redirected to composition child ZI_Booking_enb,
    _Currency,
    _Customer,
    _OverallStatus

}
