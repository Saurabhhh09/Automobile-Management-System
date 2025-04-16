<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="KIA.Admin.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row mt-5">
        <div class="col-lg-10 col-md-10 col-sm-12 col-12 mt-5 mx-auto py-3">
            <h1 class="text-center">Orders</h1>
            <asp:GridView ID="GV_OrderDetails" runat="server" CssClass="mx-auto table table-striped table-hover table-border text-center"></asp:GridView>
        </div>
    </div>

</asp:Content>
