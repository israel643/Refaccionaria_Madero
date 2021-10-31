using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Refaccionaria.Models
{
    public class User
    {
        public int No_empleado { get; set; }
        public string Nombre_emple { get; set; }
        public string Usuario { get; set;  }
        public string Contraseña { get; set; }

    }
}