//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ISW2PDT5
{
    using System;
    using System.Collections.Generic;
    
    public partial class producto
    {
        public producto()
        {
            this.compras = new HashSet<compra>();
            this.detalle_venta = new HashSet<detalle_venta>();
            this.producto_sucursal = new HashSet<producto_sucursal>();
            this.venta_producto = new HashSet<venta_producto>();
        }
    
        public int id_producto { get; set; }
        public int CATEGORIA_PRODUCTO_id_categoria_producto { get; set; }
        public int INVENTARIO_inventario { get; set; }
        public int PRESENTACION_PRODUCTO_id_presentacion_producto { get; set; }
        public int SECCION_BODEGA_id_seccion_bodega { get; set; }
        public double precio_unit { get; set; }
    
        public virtual categoria_producto categoria_producto { get; set; }
        public virtual ICollection<compra> compras { get; set; }
        public virtual ICollection<detalle_venta> detalle_venta { get; set; }
        public virtual presentacion_producto presentacion_producto { get; set; }
        public virtual venta venta { get; set; }
        public virtual seccion_bodega seccion_bodega { get; set; }
        public virtual ICollection<producto_sucursal> producto_sucursal { get; set; }
        public virtual ICollection<venta_producto> venta_producto { get; set; }
    }
}