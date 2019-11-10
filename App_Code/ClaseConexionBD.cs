using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class ClaseConexionBD
{
    public SqlConnection conexion;
    public SqlCommand comando;
    public SqlDataAdapter da;
    public DataSet dset;

	public ClaseConexionBD()
	{
        conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["ejemploConnectionString1"].ConnectionString);
	}

    public void insertar(String rut, String nom, String tel, int ciudad) 
    {
        String guardar = "insert into usuario(rut,nombre,telefono,ciudad) values ('"+ rut +"','"+ nom +"','"+ tel +"',"+ ciudad +")";
        ejecutar(guardar);
    }

    public void modificar(String rut, String nom, String tel, int ciudad) 
    {
        String update = "update usuario set rut='" + rut + "',nombre='" + nom + "',telefono='" + tel + "', ciudad= " + ciudad + "  where rut= '" + rut + "'   ";
        ejecutar(update);
    }

    public void eliminar(String rut) 
    {
        String borrar = "delete from usuario where rut='" + rut + "' ";
        ejecutar(borrar);
    }

    public DataSet BuscarxRut(String rut) 
    {
        dset = new DataSet();
        ClaseConexionBD con = new ClaseConexionBD();
        con.conexion.Open();
        String select = "select * from usuario where rut='" + rut + "'";
        da = new SqlDataAdapter(select, con.conexion);
        da.Fill(dset);
        con.conexion.Close();
        return dset;
    }

    private void ejecutar(string cadena) 
    {
        ClaseConexionBD con = new ClaseConexionBD();
        con.conexion.Open();
        con.comando = new SqlCommand(cadena,con.conexion);
        con.comando.ExecuteNonQuery();
        con.conexion.Close();
    }
}