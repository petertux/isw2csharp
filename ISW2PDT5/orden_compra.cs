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
    
    public partial class orden_compra
    {
        public orden_compra()
        {
            this.compras = new HashSet<compra>();
        }
    
        public int id_orden_compra { get; set; }
        public System.DateTime fecha_orden_compra { get; set; }
    
        public virtual ICollection<compra> compras { get; set; }
    }
}
