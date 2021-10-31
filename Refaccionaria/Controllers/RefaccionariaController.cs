using Refaccionaria.Models;
using System;
using System.Collections.Generic;
using System.Web.Mvc;

namespace Refaccionaria.Controllers
{
    public class RefaccionariaController : Controller
    {
        Refaccionaria.Models.Refaccionaria Prod = new Models.Refaccionaria();

        //Metodo para el Logeo del usuario
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(FormCollection F)
        {
            User U = new User
            {
                Usuario = F["email"].ToString(),
                Contraseña = F["password"].ToString()
            };
            User newUser = Prod.Login(U);

            if(newUser.No_empleado != 0)
            {
                Session["user"] = newUser.No_empleado.ToString();
                return RedirectToAction("ListarProd");
            }
            else
            {
                ViewBag.Error = "No se encontro el usuario";
                return View();
            }

            
        }
        //Metodo para deslogear al usuario
        public ActionResult Logout()
        {
            Session.Clear();

            return RedirectToAction("Login");
        }

        // GET: Refaccionaria
        //Vista principal del listado de productos
        public ActionResult ListarProd()
        {
            int ID = Convert.ToInt32(Session["user"]);

            if(ID != 0)
            {
                List<Producto> Listapro = Prod.GetProductos();
                return View(Listapro);
            }
            else
            {
                return RedirectToAction("Login");
            }

        }
        //Vista del formulario para dar de alta a un producto
        public ActionResult RegistrarProd()
        {
            
            int ID = Convert.ToInt32(Session["user"]);

            if (ID != 0)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Login");
            }
        }
        //Metodo de envio del formulario para crear el nuevo producto
        [HttpPost]
        public ActionResult RegistrarProd(FormCollection F)
        {
            Producto NuevoProd = new Producto()
            {
                No_Categoria = Convert.ToInt32(F["Categoria"]),
                Nombre_prod = F["Nombre_prod"].ToString(),
                Precio_venta = Convert.ToDouble(F["Precio_venta"]),
                Stock = Convert.ToInt32(F["Stock"]),
                Descripcion = F["Descripcion"].ToString(),
                Precio_compra = Convert.ToDouble(F["Precio_compra"]),
                Img = F["Img"].ToString()
            };
            Prod.RegistraProducto(NuevoProd);
            return RedirectToAction("ListarProd");
        }
        //Vista de detalle para poder modificar un producto
        public ActionResult Modificar(int id)
        {
            int ID = Convert.ToInt32(Session["user"]);

            if (ID != 0)
            {
                Producto prod = Prod.FindProducto(id);
                return View(prod);
            }
            else
            {
                return RedirectToAction("Login");
            }
        }
        //Metodo de envio del formulario para actualizar el producto
        [HttpPost]
        public ActionResult Modificar(FormCollection F)
        {
            Producto NuevoProd = new Producto()
            {
                No_producto = Convert.ToInt32(F["No_producto"]),
                No_Categoria = Convert.ToInt32(F["Categoria"]),
                Nombre_prod = F["Nombre"].ToString(),
                Precio_venta = Convert.ToDouble(F["PrecioV"]),
                Stock = Convert.ToInt32(F["Stock"]),
                Descripcion = F["Descripcion"].ToString(),
                Precio_compra = Convert.ToDouble(F["PrecioC"]),
                Img = F["Img"].ToString()
            };
            Prod.Actualizar(NuevoProd);
            return RedirectToAction("ListarProd");
        }
        //Metodo para eliminar un producto
        public ActionResult Eliminar(int id)
        {
            int ID = Convert.ToInt32(Session["user"]);

            if (ID != 0)
            {
                Prod.BorrarProducto(id);
                return RedirectToAction("ListarProd");
            }
            else
            {
                return RedirectToAction("Login");
            }

        }
    }
}