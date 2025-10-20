@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement Consumption enattesb'

@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.semanticKey: ['BookingSupplementID']
define view entity ZC_BookingSupplement_Enb
  as projection on ZI_BookingSupplement_Enb
{
  key BooksupplUuid,
      TravelUuid,
      BookingUuid,

      @Search: { defaultSearchElement: true,
                 ranking: #HIGH,
                 fuzzinessThreshold: 0.8 }
      BookingSupplementId,

      @ObjectModel.text.element: ['SupplementDescription']
      @Consumption.valueHelpDefinition: [
          { entity: {name: '/DMO/I_Supplement_StdVH', element: 'SupplementID' },
            additionalBinding: [ { localElement: 'BookSupplPrice',  element: 'Price',        usage: #RESULT },
                                 { localElement: 'CurrencyCode',    element: 'CurrencyCode', usage: #RESULT }],
            useForValidation: true }]
      SupplementId,
      _SupplementText.Description as SupplementDescription : localized,

      BookSupplPrice,
      @Consumption.valueHelpDefinition: [
          { entity: {name: 'I_CurrencyStdVH', element: 'Currency' },
            useForValidation: true }]
      CurrencyCode,
      LocalLastChangedAt,
      /* Associations */
      _Booking : redirected to parent ZC_Booking_Enb,
      _Product,
      _SupplementText,
      _Travel  : redirected to ZC_Travel_Enb
}
