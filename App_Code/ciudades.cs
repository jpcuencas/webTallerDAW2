using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data;

/// <summary>
/// Descripción breve de paises
/// </summary>
public class ciudades
{
    public static string msgError { get; set;  }

	public ciudades()
	{

	}

    public static List<ciudad> listadoCiudadesPorPais(int pais, string orden="nombre_es", string sentido = "ASC")
    {

        List<ciudad> listado = new List<ciudad>();

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["provesDAW"].ConnectionString);

        msgError = "";

        try
        {
            con.Open();

            SqlCommand sentencia = new SqlCommand();
            sentencia.CommandType = System.Data.CommandType.Text;
            sentencia.Connection = con;
            string sql = " select id, nombre_es, nombre_en, pais from ciudades where pais = " + pais.ToString();
            if (orden != "")
            {
                sql += " order by " + orden;
                if (sentido != "")
                {
                    sql += " " + sentido;
                }
            }
            sentencia.CommandText = sql;

            SqlDataReader rs = sentencia.ExecuteReader();

            if (rs.HasRows)
            {
                while (rs.Read())
                {
                    ciudad aux = new ciudad();
                    aux.id = Convert.ToInt32(rs["id"].ToString());
                    aux.nombre_es = rs["nombre_es"].ToString();
                    aux.nombre_en = rs["nombre_en"] != null ? rs["nombre_en"].ToString() : rs["nombre_es"].ToString();
                    aux.pais = Convert.ToInt32(rs["pais"].ToString());
                    listado.Add(aux);
                }
            }
            else
            {
                listado = null;
            }
        }
        catch (Exception ex)
        {
            msgError = "Error al obtener las ciudades. Causa: " + ex.Message;
        }
        finally
        {
            con.Close();
        }

        return listado;
    }
}