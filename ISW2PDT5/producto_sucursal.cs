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
    
    public partial class producto_sucursal
    {
        public int PRODUCTO_id_producto { get; set; }
        public int SUCURSAL_id_sucursal { get; set; }
        public string estado_producto { get; set; }
    
        public virtual producto producto { get; set; }
        public virtual sucursal sucursal { get; set; }
    }
}