<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="KIA.User.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row mt-5">
        <div class="col-lg-8 col-sm-12 col-12 mt-5 mx-auto mb-3" style="background-color: #eff1f2;">
            <h1 class="text-center py-5">Profile..</h1>
            <hr class="border-bottom border-dark" />
            <div class="row mt-4 mb-5">
                <div class="col-lg-7 mx-auto mb-2">
                    <strong>
                        <label>Name:</label></strong>
                    <asp:TextBox runat="server" ID="txtName" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-lg-7 mx-auto mb-2">
                    <strong>
                        <label>Email:</label></strong>
                    <asp:TextBox runat="server" ID="txtEmail" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-lg-7 mx-auto mb-2">
                    <strong>
                        <label>Password:</label></strong>
                    <asp:TextBox runat="server" ID="txtPass" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-lg-7 mx-auto mb-2">
                    <strong>
                        <label>Contact No:</label></strong>
                    <asp:TextBox runat="server" ID="txtCont" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                </div>
                <hr class="border-bottom border-dark mt-4" />
                <h1 class="text-center">Change Password</h1>
                <div class="col-lg-7 mx-auto mb-2">
                    <strong>
                        <label>Change Password</label></strong>
                    <asp:TextBox runat="server" ID="txtChangePass" CssClass="form-control"></asp:TextBox>
                    <center>
                        <asp:Button ID="btn" runat="server" Text="Update" CssClass="btn btn-primary my-2" OnClick="btn_Click"/>
                    </center>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
