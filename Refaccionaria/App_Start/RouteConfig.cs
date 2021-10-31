using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Refaccionaria
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Refaccionaria", action = "ListarProd", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Login",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Refaccionaria", action = "Login", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Modificar",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Refaccionaria", action = "Modificar", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Eliminar",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Refaccionaria", action = "Eliminar", id = UrlParameter.Optional }
            );
        }
    }
}
