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
    
    public partial class nota_credito
    {
        public nota_credito()
        {
            this.compras = new HashSet<compra>();
        }
    
        public int id_nora_credito { get; set; }
        public int FACTURACION_id_facturacion { get; set; }
        public int TIPO_NOTA_CREDITO_id_tipo_nota_credito { get; set; }
    
        public virtual ICollection<compra> compras { get; set; }
        public virtual tipo_nota_credito tipo_nota_credito { get; set; }
    }
}