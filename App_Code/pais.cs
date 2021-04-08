using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de pais
/// </summary>
public class pais
{
    public int id { get; set; }
    public string nombre_es { get; set; }
    public string nombre_en { get; set; }

	public pais()
	{
        id = 0;
        nombre_es = "";
        nombre_en = "";
    }
}