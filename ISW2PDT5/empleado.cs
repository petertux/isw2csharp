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
    
    public partial class empleado
    {
        public int id_empleado { get; set; }
        public int PERSONA_id_persona { get; set; }
        public int USUARIO_id_usuario { get; set; }
        public int SUCURSAL_id_sucursal { get; set; }
    
        public virtual persona persona { get; set; }
        public virtual sucursal sucursal { get; set; }
        public virtual usuario usuario { get; set; }
    }
}
