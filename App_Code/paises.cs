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
public class paises
{
    public static string msgError { get; set;  }

	public paises()
	{

	}

    public static List<pais> listadoPaises(string orden="nombre_es", string sentido = "ASC")
    {
        List<pais> listado = new List<pais>();

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["provesDAW"].ConnectionString);

        msgError = "";

        try
        {
            con.Open();

            SqlCommand sentencia = new SqlCommand();
            sentencia.CommandType = System.Data.CommandType.Text;
            sentencia.Connection = con;
            string sql = " select id, nombre_es, nombre_en from paises ";
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
                    pais aux = new pais();
                    aux.id = Convert.ToInt32(rs["id"].ToString());
                    aux.nombre_es = rs["nombre_es"].ToString();
                    aux.nombre_en = rs["nombre_en"] != null ? rs["nombre_en"].ToString() : rs["nombre_es"].ToString();
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
            msgError = "Error al obtener los paises. Causa: " + ex.Message;
        }
        finally
        {
            con.Close();
        }

        return listado;
    }

    public static void cargaSelectPaises(DropDownList desplegable, string idioma)
    {

        DataTable paises = new DataTable();

        string atributo = "nombre_es";
        switch (idioma)
        {
            case "es":
                atributo = "nombre_es";
                break;
            case "en":
                atributo = "nombre_en";
                break;
            default:
                atributo = "nombre_es";
                break;
        }

        msgError = "";

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["provesDAW"].ConnectionString))
        {

            try
            {
                SqlDataAdapter adapter = new SqlDataAdapter("select id, " + atributo + " as nombre from paises order by " + atributo, con);
                adapter.Fill(paises);

                desplegable.DataSource = paises;
                desplegable.DataTextField = "nombre";
                desplegable.DataValueField = "id";
                desplegable.DataBind();
            }
            catch (Exception ex)
            {
                msgError = "Error al obtener los paises (poblando el desplegable). Causa: " + ex.Message;
            }
            finally
            {
                con.Close();
            }

        }

    }
}