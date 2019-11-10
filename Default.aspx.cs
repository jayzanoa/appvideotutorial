using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

public partial class _Default : System.Web.UI.Page
{
    ClaseConexionBD en = new ClaseConexionBD();
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private void limpiar() 
    {
        txt_rut.Text = "";
        txt_nom.Text = "";
        txt_rut.Enabled = true;
        txt_nom.Enabled = true;
        txt_fono.Text = "";
        cbo_ciudad.SelectedIndex = -1;
    }

    protected void btn_insertar_Click(object sender, EventArgs e)
    {
        if (txt_rut.Enabled)
        {
            int ciu;
            ciu = int.Parse(cbo_ciudad.SelectedValue.ToString());
            en.insertar(txt_rut.Text, txt_nom.Text, txt_fono.Text, ciu);
            GridView1.DataBind();
            Mensaje.Text = "Registro ok";
            limpiar();
        }
        else
        {
            int ciu;
            ciu = int.Parse(cbo_ciudad.SelectedValue.ToString());
            en.modificar(txt_rut.Text, txt_nom.Text, txt_fono.Text, ciu);
            GridView1.DataBind();
            Mensaje.Text = "Registro Actualizado";
            limpiar();
        } 
    }
    protected void btn_actualizar_Click(object sender, EventArgs e)
    {
        int ciu;
        ciu = int.Parse(cbo_ciudad.SelectedValue.ToString());
        en.modificar(txt_rut.Text, txt_nom.Text, txt_fono.Text, ciu);
        GridView1.DataBind();
        Mensaje.Text = "Registro Actualizado";
        limpiar();
    }
    protected void btn_eliminar_Click(object sender, EventArgs e)
    {
        en.eliminar(txt_rut.Text);
        Mensaje.Text = "Eliminado";
        GridView1.DataBind();
        limpiar();
    }
    protected void btn_buscar_Click(object sender, EventArgs e)
    {
        DataSet dset;
        dset = en.BuscarxRut(txt_rut.Text);
        if (dset.Tables.Count > 0)
        {
            if (dset.Tables[0].Rows.Count > 0)
            {
                txt_rut.Text = dset.Tables[0].Rows[0][0].ToString();
                txt_nom.Text = dset.Tables[0].Rows[0][1].ToString();
                txt_fono.Text = dset.Tables[0].Rows[0][2].ToString();
                cbo_ciudad.Text = dset.Tables[0].Rows[0][3].ToString();
                txt_rut.Enabled = false;
                txt_nom.Enabled = false;
                Mensaje.Text = "Registros econtrados";
            }
            else
            {
                Mensaje.Text = "Registros no econtrados";
            }
        }
    }
 
}