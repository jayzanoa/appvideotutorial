<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>formulario con bd sql server</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table bgcolor="#99ccff" >
            <tr>
               <th colspan="2">Formulario registro</th>
            </tr>
            <tr>
               <td>rut:</td>
                <td>
                    <asp:TextBox ID="txt_rut" runat="server"></asp:TextBox>
                    <asp:Button ID="btn_buscar" runat="server" Text="Buscar" OnClick="btn_buscar_Click" />
                </td>
            </tr>
            <tr>
                 <td>Nombre:</td>
                <td>
                    <asp:TextBox ID="txt_nom" runat="server"></asp:TextBox>
                 </td>                
            </tr>
            <tr>
                 <td>Telefono:</td>
                <td>
                    <asp:TextBox ID="txt_fono" runat="server"></asp:TextBox>
                 </td>                
            </tr>
            <tr>
                 <td>Ciudad:</td>
                <td>
                    <asp:DropDownList ID="cbo_ciudad" runat="server" DataSourceID="SqlDataSource1" DataTextField="nom_ciudad" DataValueField="cod_ciudad">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ejemploConnectionString1 %>" SelectCommand="SELECT * FROM [ciudades]"></asp:SqlDataSource>
                 </td>                
            </tr>
              <tr>
                 <td>
                     <asp:Button ID="btn_insertar" runat="server" Text="Insertar" OnClick="btn_insertar_Click" />
                  </td>
                <td>                    
                    <asp:Button ID="btn_actualizar" runat="server" Text="Actualizar" OnClick="btn_actualizar_Click" />
                    <asp:Button ID="btn_eliminar" runat="server" Text="Eliminar" OnClick="btn_eliminar_Click" />
                    
                 </td>                
            </tr>
        </table>
    </div>
        <asp:Label ID="Mensaje" runat="server" ForeColor="Red" Text="Label"></asp:Label>
    <h4>GRIDVIEW</h4>

        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="rut" DataSourceID="SqlDataSource2" EmptyDataText="No hay registros de datos para mostrar.">
            <Columns>
                <asp:BoundField DataField="rut" HeaderText="rut" ReadOnly="True" SortExpression="rut" />
                <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                <asp:BoundField DataField="telefono" HeaderText="telefono" SortExpression="telefono" />
                <asp:BoundField DataField="nom_ciudad" HeaderText="nom_ciudad" SortExpression="nom_ciudad" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ejemploConnectionString2 %>" DeleteCommand="DELETE FROM [usuario] WHERE [rut] = @rut" InsertCommand="INSERT INTO [usuario] ([rut], [nombre], [telefono], [ciudad]) VALUES (@rut, @nombre, @telefono, @ciudad)" SelectCommand="SELECT usuario.rut, usuario.nombre, usuario.telefono, ciudades.nom_ciudad FROM usuario INNER JOIN ciudades ON usuario.ciudad = ciudades.cod_ciudad" UpdateCommand="UPDATE [usuario] SET [nombre] = @nombre, [telefono] = @telefono, [ciudad] = @ciudad WHERE [rut] = @rut">
            <DeleteParameters>
                <asp:Parameter Name="rut" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="rut" Type="String" />
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="telefono" Type="String" />
                <asp:Parameter Name="ciudad" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="telefono" Type="String" />
                <asp:Parameter Name="ciudad" Type="Int32" />
                <asp:Parameter Name="rut" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <br />
        <h2>Control enlace de datos</h2>
        <h2>gridview2</h2>


        <p>
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="rut" DataSourceID="SqlDataSource3" EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="rut" HeaderText="rut" ReadOnly="True" SortExpression="rut" />
                    <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                    <asp:BoundField DataField="telefono" HeaderText="telefono" SortExpression="telefono" />
                    <asp:BoundField DataField="ciudad" HeaderText="ciudad" SortExpression="ciudad" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ejemploConnectionString2 %>" DeleteCommand="DELETE FROM [usuario] WHERE [rut] = @rut" InsertCommand="INSERT INTO [usuario] ([rut], [nombre], [telefono], [ciudad]) VALUES (@rut, @nombre, @telefono, @ciudad)" ProviderName="<%$ ConnectionStrings:ejemploConnectionString2.ProviderName %>" SelectCommand="SELECT [rut], [nombre], [telefono], [ciudad] FROM [usuario]" UpdateCommand="UPDATE [usuario] SET [nombre] = @nombre, [telefono] = @telefono, [ciudad] = @ciudad WHERE [rut] = @rut">
                <DeleteParameters>
                    <asp:Parameter Name="rut" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="rut" Type="String" />
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="telefono" Type="String" />
                    <asp:Parameter Name="ciudad" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="telefono" Type="String" />
                    <asp:Parameter Name="ciudad" Type="Int32" />
                    <asp:Parameter Name="rut" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
        <h2>DetailsView</h2>
        <p>
            <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" CellPadding="4" DataKeyNames="rut" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Height="50px" Width="125px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <EditRowStyle BackColor="#999999" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="rut" HeaderText="rut" ReadOnly="True" SortExpression="rut" />
                    <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                    <asp:BoundField DataField="telefono" HeaderText="telefono" SortExpression="telefono" />
                    <asp:BoundField DataField="ciudad" HeaderText="ciudad" SortExpression="ciudad" />
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ejemploConnectionString1 %>" DeleteCommand="DELETE FROM [usuario] WHERE [rut] = @rut" InsertCommand="INSERT INTO [usuario] ([rut], [nombre], [telefono], [ciudad]) VALUES (@rut, @nombre, @telefono, @ciudad)" SelectCommand="SELECT * FROM [usuario] WHERE ([rut] = @rut)" UpdateCommand="UPDATE [usuario] SET [nombre] = @nombre, [telefono] = @telefono, [ciudad] = @ciudad WHERE [rut] = @rut">
                <DeleteParameters>
                    <asp:Parameter Name="rut" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="rut" Type="String" />
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="telefono" Type="String" />
                    <asp:Parameter Name="ciudad" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView2" Name="rut" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="telefono" Type="String" />
                    <asp:Parameter Name="ciudad" Type="Int32" />
                    <asp:Parameter Name="rut" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>  
        <h2>Formview</h2>
        <p>
            <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="rut" DataSourceID="SqlDataSource3" ForeColor="#333333" AllowPaging="True">
                <EditItemTemplate>
                    rut:
                    <asp:Label ID="rutLabel1" runat="server" Text='<%# Eval("rut") %>' />
                    <br />
                    nombre:
                    <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                    <br />
                    telefono:
                    <asp:TextBox ID="telefonoTextBox" runat="server" Text='<%# Bind("telefono") %>' />
                    <br />
                    ciudad:
                    <asp:TextBox ID="ciudadTextBox" runat="server" Text='<%# Bind("ciudad") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                </EditItemTemplate>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <InsertItemTemplate>
                    rut:
                    <asp:TextBox ID="rutTextBox" runat="server" Text='<%# Bind("rut") %>' />
                    <br />
                    nombre:
                    <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                    <br />
                    telefono:
                    <asp:TextBox ID="telefonoTextBox" runat="server" Text='<%# Bind("telefono") %>' />
                    <br />
                    ciudad:
                    <asp:TextBox ID="ciudadTextBox" runat="server" Text='<%# Bind("ciudad") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                </InsertItemTemplate>
                <ItemTemplate>
                    rut:
                    <asp:Label ID="rutLabel" runat="server" Text='<%# Eval("rut") %>' />
                    <br />
                    nombre:
                    <asp:Label ID="nombreLabel" runat="server" Text='<%# Bind("nombre") %>' />
                    <br />
                    telefono:
                    <asp:Label ID="telefonoLabel" runat="server" Text='<%# Bind("telefono") %>' />
                    <br />
                    ciudad:
                    <asp:Label ID="ciudadLabel" runat="server" Text='<%# Bind("ciudad") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Nuevo" />
                </ItemTemplate>
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:FormView>
        </p>    
        <h2>Chart</h2>
        <p>
            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource5">
                <Series>
                    <asp:Series ChartArea="ChartArea1" ChartType="Pie" Name="Series1" XValueMember="nom_ciudad" YValueMembers="total_usarios">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ejemploConnectionString1 %>" SelectCommand="SELECT COUNT(*) AS total_usarios, ciudades.nom_ciudad FROM ciudades INNER JOIN usuario ON ciudades.cod_ciudad = usuario.ciudad INNER JOIN usuario AS usuario_1 ON ciudades.cod_ciudad = usuario_1.ciudad GROUP BY ciudades.nom_ciudad"></asp:SqlDataSource>
        </p> 
        <h2>Datalist</h2>
        <p>
            <asp:DataList ID="DataList1" runat="server" BorderWidth="1px" CellPadding="4" DataKeyField="rut" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="Both" RepeatColumns="4" RepeatDirection="Horizontal">
                <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <ItemTemplate>
                    rut:
                    <asp:Label ID="rutLabel" runat="server" Text='<%# Eval("rut") %>' />
                    <br />
                    nombre:
                    <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                    <br />
                    telefono:
                    <asp:Label ID="telefonoLabel" runat="server" Text='<%# Eval("telefono") %>' />
                    <br />
                    ciudad:
                    <asp:Label ID="ciudadLabel" runat="server" Text='<%# Eval("ciudad") %>' />
                    <br />
<br />
                </ItemTemplate>
                <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            </asp:DataList>
        </p>
            
    </form>
    
</body>
</html>
