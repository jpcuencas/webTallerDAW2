using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de ciudad
/// </summary>
public class ciudad
{
	public int id { get; set; }
    public string nombre_es { get; set; }
    public string nombre_en { get; set; }
    public int pais { get; set; }

	public ciudad()
	{
        id = 0;
        nombre_es = "";
        nombre_en = "";
        pais=0;
    }
}