<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="TestDriveDetails.aspx.cs" Inherits="KIA.Admin.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid mt-5" style="min-height: 70vh;">
        <div class="row mt-5">
            <div class="col-lg-7 mt-5 mx-auto">
                <h1 class="text-center pt-5">Test Drive Requests</h1>
                <asp:Label ID="lblMsg" runat="server" Visible="false" CssClass="fw-bold"></asp:Label>

                <asp:GridView ID="TestDriveListGridView" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover"
                    OnPageIndexChanging="TestDriveListGridView_PageIndexChanging" PageSize="10" AllowPaging="true"
                    DataKeyNames="Id">
                    <Columns>
                        <asp:TemplateField HeaderText="Id">
                            <ItemTemplate>
                                <asp:Label ID="lblId" runat="server" Text='<%#Bind("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Id">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# Bind("UserId")%>'></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Car Id">
                            <ItemTemplate>
                                <asp:Label ID="lblCarId" runat="server" Text='<%# Bind("CarId")%>'></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Showroom Id">
                            <ItemTemplate>
                                <asp:Label ID="lblShowrromId" runat="server" Text='<%# Bind("ShowroomId")%>'></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Date">
                            <ItemTemplate>
                                <asp:Label ID="lblDate" runat="server" Text='<%# Bind("Date")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                   
                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </div>
</asp:Content>
