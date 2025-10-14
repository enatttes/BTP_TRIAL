@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Interface Libros enattesb'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_Libros_Enatt
  as select from ZR_Libros_Enatt_TP
  association [1..1] to ZI_Ventas_Libros_Enatt as _Ventas     on $projection.Libro = _Ventas.Libro
  association [1..1] to ZI_Categoria_Enatt     as _Categorias on $projection.Categoria = _Categorias.Categoria
{
  key Libro,
  key Categoria,
      _Categorias.DescripcionCategoria,
      Titulo,
      Autor,
      Editorial,
      Idioma,
      Paginas,
      @Semantics.amount.currencyCode: 'Moneda'
      Precio,
      Moneda,
      Formato,
      Imagen,
      _Ventas.CantidadVendida,
      case
        when _Ventas.CantidadVendida < 0 then 0
        when _Ventas.CantidadVendida < 3 then 1
        when _Ventas.CantidadVendida < 8 then 2
        else 3
      end as NivelVentas,

      _Ventas,
      _Categorias
}
