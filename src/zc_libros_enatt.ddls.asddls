@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Consumo Libros enattesb'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_Libros_Enatt
  as select from ZI_Libros_Enatt
  association [1..1] to ZC_Lectores_Enatt as _Lectores on $projection.Libro = _Lectores.Libro
{
  key Libro,
      Titulo,
      Autor,
      Editorial,
      Categoria,
      DescripcionCategoria,
      Idioma,
      Paginas,
      Formato,
      CantidadVendida,
      NivelVentas,
      case NivelVentas
        when 0 then 'Sin Ventas'
        when 1 then 'Bajas Ventas'
        when 2 then 'Popular en Ventas'
        else 'Best Seller'
      end as DescripcionNivelVentas,
      @Semantics.amount.currencyCode: 'Moneda'
      Precio,
      Moneda,
      Imagen,

      // Associations
      _Lectores

}
