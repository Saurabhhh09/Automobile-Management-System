<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddCarType.aspx.cs" Inherits="KIA.Admin.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid mt-5" style="min-height:70vh;">
        <div class="row mt-5 pt-5">
            <div class="col-lg-6 col-sm-12 mx-auto">
                <h1 class="text-center pt-5 pb-3">Add New Car Type</h1>
                <div class="form-group mb-4">
                    <strong>Type :</strong>
                    <asp:TextBox ID="txtType" runat="server" CssClass="form-control" placeholder="Enter Type of Car"></asp:TextBox>
                </div>
                <div class="col-lg-4"><asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-secondary btn-block w-100" OnClick="btnAdd_Click"/></div>
            </div>
        </div>
    </div>
</asp:Content>
