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
    
    public partial class departamento
    {
        public departamento()
        {
            this.municipios = new HashSet<municipio>();
        }
    
        public int id_departamento { get; set; }
        public string dep_nombre { get; set; }
    
        public virtual ICollection<municipio> municipios { get; set; }
    }
}
