using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Refaccionaria.Models
{
    public class Producto
    {
        public int No_producto { set; get; }
        public int No_Categoria { set; get; }
        public string Nombre_prod { set; get; }
        public double Precio_venta { set; get; }
        public int Stock { set; get; }
        public string Descripcion { set; get; }
        public string Img { set; get; }
        public double Precio_compra { set; get; }

    }
}