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
    
    public partial class venta
    {
        public venta()
        {
            this.detalle_venta = new HashSet<detalle_venta>();
            this.productoes = new HashSet<producto>();
            this.venta_producto = new HashSet<venta_producto>();
        }
    
        public int id_venta { get; set; }
        public int TIPO_VENTA_id_tipo_venta { get; set; }
        public System.DateTime vent_fech { get; set; }
        public int USUARIO_id_usuario { get; set; }
    
        public virtual ICollection<detalle_venta> detalle_venta { get; set; }
        public virtual ICollection<producto> productoes { get; set; }
        public virtual tipo_venta tipo_venta { get; set; }
        public virtual usuario usuario { get; set; }
        public virtual ICollection<venta_producto> venta_producto { get; set; }
    }
}
