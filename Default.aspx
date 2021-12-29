<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="markercheker._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

 <table>
       <tr>
           <td>Product Id</td>
            <td>
                <asp:TextBox ID="productid" runat="server"></asp:TextBox></td>
       </tr>
       <tr>
           <td>Product Name</td>
            <td>  <asp:TextBox ID="productName" runat="server"></asp:TextBox></td>
       </tr>
       <tr>
           <td>Maker Id</td>
            <td>  <asp:TextBox ID="makerid" runat="server"></asp:TextBox></td>
       </tr>
       <tr>
           <td>Maker Name</td>
            <td>  <asp:TextBox ID="makername" runat="server"></asp:TextBox></td>
       </tr>

              <tr>
                  <td>
                      <asp:Label ID="insertstatus" runat="server" ></asp:Label></td>
           <td>
               <asp:Button ID="Button1" runat="server" Text="Button" OnClick="saveProduct"/>
               <a href="checker.aspx">Go to checker</a>
           </td>
       </tr>
   </table>



  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" AllowPaging="true"
    OnPageIndexChanging="OnPageIndexChanging" PageSize="10">
    <Columns>
        <asp:BoundField ItemStyle-Width="150px" DataField="id" HeaderText="id" />
        <asp:BoundField ItemStyle-Width="150px" DataField="productid" HeaderText="Product id" />
        <asp:BoundField ItemStyle-Width="150px" DataField="productname" HeaderText="Product Name" />
        <asp:BoundField ItemStyle-Width="150px" DataField="makerid" HeaderText="makerid" />
        <asp:BoundField ItemStyle-Width="150px" DataField="makername" HeaderText="Maker Name" />
        <asp:BoundField ItemStyle-Width="150px" DataField="pr_status" HeaderText="Status" />
    </Columns>
</asp:GridView>

</asp:Content>
