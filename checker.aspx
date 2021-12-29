<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="checker.aspx.cs" Inherits="markercheker.checker" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
<%--    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" AllowPaging="true"
    OnPageIndexChanging="OnPageIndexChanging" PageSize="10">
    <Columns>
        <asp:CheckBox runat="server"/>
        <asp:BoundField ItemStyle-Width="150px" DataField="id" HeaderText="id" />
        <asp:BoundField ItemStyle-Width="150px" DataField="productid" HeaderText="Product id" />
        <asp:BoundField ItemStyle-Width="150px" DataField="productname" HeaderText="Product Name" />
        <asp:BoundField ItemStyle-Width="150px" DataField="makerid" HeaderText="makerid" />
        <asp:BoundField ItemStyle-Width="150px" DataField="makername" HeaderText="Maker Name" />
        <asp:BoundField ItemStyle-Width="150px" DataField="pr_status" HeaderText="Status" />
    </Columns>
</asp:GridView>--%>


<asp:GridView ID="GridView1" runat="server" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
    AutoGenerateColumns="false" OnSelectedIndexChanged = "OnSelectedIndexChanged">
    <Columns>
   
             <asp:TemplateField HeaderText="ID">  
                    <ItemTemplate>  
                        <asp:Label ID="id" runat="server" Text='<%# Bind("id") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 
        <asp:BoundField ItemStyle-Width="150px" DataField="productid" HeaderText="Product id" />
        <asp:BoundField ItemStyle-Width="150px" DataField="productname" HeaderText="Product Name" />
        <asp:BoundField ItemStyle-Width="150px" DataField="makerid" HeaderText="makerid" />
        <asp:BoundField ItemStyle-Width="150px" DataField="makername" HeaderText="Maker Name" />
        <asp:BoundField ItemStyle-Width="150px" DataField="pr_status" HeaderText="Status" />

   <asp:TemplateField HeaderText="pr_status" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:Label ID="changestatus" runat="server" Text='<%# Eval("pr_status") %>'></asp:Label>
            </ItemTemplate>
    </asp:TemplateField>
        <asp:ButtonField Text="Select" CommandName="Select" ItemStyle-Width="150" />
    <asp:TemplateField HeaderText="Status">  
                    <EditItemTemplate>  
                        <asp:CheckBox ID="CheckBox1" runat="server" Text='<%# Bind("id") %>'/>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:CheckBox ID="CheckBox1" runat="server" Text='<%# Bind("id") %>'/>  
                    </ItemTemplate>  
     </asp:TemplateField>  
    </Columns>
</asp:GridView>
<br />
<u>Selected Row Values: </u>
<br />
<br />
<asp:Label ID="lblValues" runat="server" Text=""></asp:Label>


       <asp:Button ID="Button1" runat="server" Text="APPROVED" OnClick="ApproveButton"/>
    <asp:Button ID="Button2" runat="server" Text="REJECT" OnClick="RejectButton"/>
</asp:Content>
