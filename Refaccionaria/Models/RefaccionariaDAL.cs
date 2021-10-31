using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace Refaccionaria.Models
{
    public class Refaccionaria
    {
        private string cadena;

        public Refaccionaria() 
        {
            cadena = System.Configuration.ConfigurationManager.ConnectionStrings["BDRefaccionaria"].ConnectionString;
        }
        //Metodo para obtener la lista completa de productos
        public List<Producto> GetProductos() 
        {
            List<Producto> ListaProductos = new List<Producto>();
            using (SqlConnection conex = new SqlConnection(cadena)) 
            {
                conex.Open();
                using (SqlCommand comando = new SqlCommand())
                {
                    comando.Connection = conex;
                    comando.CommandText = "select No_producto, No_Categoria,Nombre_prod, Precio_venta, Stock, Descripcion, Img, Precio_compra from Producto;";
                    SqlDataReader Lector =  comando.ExecuteReader();

                    if (Lector.HasRows)
                    {
                        while (Lector.Read())
                        {
                            Producto articulo = new Producto()
                            {
                                No_producto = Convert.ToInt32(Lector["No_producto"]),
                                No_Categoria = Convert.ToInt32(Lector["No_Categoria"]),
                                Nombre_prod = Lector["Nombre_prod"].ToString(),
                                Precio_venta = Convert.ToDouble(Lector["Precio_venta"]),
                                Stock = Convert.ToInt32(Lector["Stock"]),
                                Descripcion = Lector["Descripcion"].ToString(),
                                Img = Lector["Img"].ToString()
                            };
                            ListaProductos.Add(articulo);
                        }
                    }
                }
                conex.Close();
            }
            return ListaProductos;
        }

        //Metodo para filtrar un solo elemento
        public Producto FindProducto(int No)
        {
            Producto fProduct = new Producto();
            using (SqlConnection conex = new SqlConnection(cadena))
            {
                conex.Open();
                using (SqlCommand comando = new SqlCommand())
                {
                    comando.Connection = conex;
                    comando.Parameters.AddWithValue("@No", No);
                    comando.CommandText = "select No_producto, No_Categoria,Nombre_prod, Precio_venta, Stock, Descripcion, Img, Precio_compra from Producto where No_producto = @No;";
                    SqlDataReader Lector = comando.ExecuteReader();

                    if (Lector.HasRows)
                    {
                        while (Lector.Read())
                        {
                            Producto objP = new Producto()
                            {
                                No_producto = Convert.ToInt32(Lector["No_producto"]),
                                No_Categoria = Convert.ToInt32(Lector["No_Categoria"]),
                                Nombre_prod = Lector["Nombre_prod"].ToString(),
                                Precio_venta = Convert.ToDouble(Lector["Precio_venta"]),
                                Precio_compra = Convert.ToDouble(Lector["Precio_compra"]),
                                Stock = Convert.ToInt32(Lector["Stock"]),
                                Descripcion = Lector["Descripcion"].ToString(),
                                Img = Lector["Img"].ToString()
                            };
                            fProduct = objP;
                        }
                    }
                }
                conex.Close();
            }
            return fProduct;
        }

        //MEtodo para eliminar un objeto de la BD
        public void BorrarProducto(int NoProd)
        {
            using (SqlConnection conex = new SqlConnection(cadena))
            {
                conex.Open();
                using (SqlCommand comando = new SqlCommand())
                {
                    comando.Connection = conex;
                    comando.Parameters.AddWithValue("@NoProd", NoProd);
                    comando.CommandText = "Delete from Producto where No_producto = @NoProd;";
                    comando.ExecuteNonQuery();
                }
                conex.Close();
            }
        }

        //MEtodo para loguear al usuario
        public User Login(User U)
        {
            User usuario = new User();
            using (SqlConnection conex = new SqlConnection(cadena))
            {
                conex.Open();
                using (SqlCommand comando = new SqlCommand())
                {
                    comando.Connection = conex;
                    comando.Parameters.AddWithValue("@user", U.Usuario);
                    comando.Parameters.AddWithValue("@password", U.Contraseña);
                    comando.CommandText = "Select No_empleado, Nombre_emple from Empleado where Usuario = @user AND Contraseña = @password;";
                    SqlDataReader Lector = comando.ExecuteReader();

                    if (Lector.HasRows)
                    {
                        while (Lector.Read())
                        {
                            User objU = new User()
                            {
                                No_empleado = Convert.ToInt32(Lector["No_empleado"]) 
                            };
                            usuario = objU;
                        }
                    }
                }
                conex.Close();
            }
            return usuario;
        }

        //Metodo para dar de alta un nuevo producto
        public void RegistraProducto(Producto Prod)
        {
            using (SqlConnection conex = new SqlConnection(cadena))
            {
                conex.Open();
                using (SqlCommand comando = new SqlCommand())
                {
                    comando.Connection = conex;
                    comando.Parameters.AddWithValue("@No_Categoria", Prod.No_Categoria);
                    comando.Parameters.AddWithValue("@Nombre_prod", Prod.Nombre_prod);
                    comando.Parameters.AddWithValue("@Precio_venta", Prod.Precio_venta);
                    comando.Parameters.AddWithValue("@Stock", Prod.Stock);
                    comando.Parameters.AddWithValue("@Descripcion", Prod.Descripcion);
                    comando.Parameters.AddWithValue("@Img", Prod.Img); 
                    comando.Parameters.AddWithValue("@Precio_compra", Prod.Precio_compra);
                    comando.CommandText = "Insert into Producto(No_Categoria,Nombre_prod,Precio_venta,Stock,Descripcion,Img,Precio_compra) values (@No_Categoria,@Nombre_prod,@Precio_venta,@Stock,@Descripcion,@Img,@Precio_compra); ";
                    comando.ExecuteNonQuery();
                }
                conex.Close();
            }
        }

        //Metodo para actualizar la informacion del usuario
        public void Actualizar(Producto Prod)
        {
            using (SqlConnection conex = new SqlConnection(cadena))
            {
                conex.Open();
                using (SqlCommand comando = new SqlCommand())
                {
                    comando.Connection = conex;
                    comando.Parameters.AddWithValue("@No_Categoria", Prod.No_Categoria);
                    comando.Parameters.AddWithValue("@Nombre_prod", Prod.Nombre_prod);
                    comando.Parameters.AddWithValue("@Precio_venta", Prod.Precio_venta);
                    comando.Parameters.AddWithValue("@Stock", Prod.Stock);
                    comando.Parameters.AddWithValue("@Descripcion", Prod.Descripcion);
                    comando.Parameters.AddWithValue("@Img", Prod.Img);
                    comando.Parameters.AddWithValue("@Precio_compra", Prod.Precio_compra);
                    comando.Parameters.AddWithValue("@No_producto", Prod.No_producto);
                    comando.CommandText = "Update Producto SET No_Categoria = @No_Categoria, Nombre_prod = @Nombre_prod, Precio_venta = @Precio_venta, Stock = @Stock, Descripcion = @Descripcion, Img = @Img, Precio_compra = @Precio_compra Where No_producto = @No_producto; ";
                    comando.ExecuteNonQuery();
                }
                conex.Close();
            }
        }

    }
}