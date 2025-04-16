<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="UserDetails.aspx.cs" Inherits="KIA.Admin.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid mt-5" style="min-height: 70vh;">
        <div class="row mt-5">
            <div class="col-lg-7 mt-5 mx-auto">
                  <h1 class="text-center pt-5">User Detail</h1>
                <asp:GridView ID="UserGridView" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover" 
                    OnPageIndexChanging="UserGridView_PageIndexChanging" PageSize="10" AllowPaging="true"
                    OnRowDeleting="UserGridView_RowDeleting" DataKeyNames="Id">
                    <Columns>
                        <asp:TemplateField HeaderText="Id">
                            <ItemTemplate>
                                <asp:Label ID="lblId" runat="server" Text='<%#Eval("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name")%>'></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email")%>'></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Password">
                            <ItemTemplate>
                                <asp:TextBox ID="txtPass" runat="server" Text='<%#Eval("Password") %>' ReadOnly="true" BorderStyle="None" Width="100"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Contact No.">
                            <ItemTemplate>
                                <asp:Label ID="lblContact" runat="server" Text='<%# Eval("Contact_No")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                     

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure to delete this row.')">Delete</asp:LinkButton>

                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            </div>

        </div>
    </div>
</asp:Content>
