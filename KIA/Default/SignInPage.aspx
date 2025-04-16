<%@ Page Title="" Language="C#" MasterPageFile="~/Default/defaultMaster.Master" AutoEventWireup="true" CodeBehind="SignInPage.aspx.cs" Inherits="KIA.Default.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    #leftContact {
        background-color: antiquewhite;
    }
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <section class="pt-5 ms-auto" id="signIn">
       <div class="container w-50 border border-dark mt-2 mb-2">
           <div class="row mt-2">
               <div class="col-md-12">
                   <h1 class="text-center display-2 fw-bolder pb-5 border-bottom border-dark"><strong>Log In</strong></h1>
               </div>
           </div>
           <div class="row mt-3 py-3">
               <div class="col-md-12">
                   <div class="form-group">
                       <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Your E-mail" TextMode="Email"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Email" SetFocusOnError="True" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email Incorrect Format." ControlToValidate="txtEmail" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                   </div>
               </div>
           </div>

           <div class="row mt-3 py-3">
               <div class="col-md-12">
                   <div class="form-group">
                       <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" placeholder="Enter Your Password" TextMode="Password"></asp:TextBox>
                       <input type="checkbox" onchange="document.getElementById('<%= txtPass.ClientID %>').type=this.checked ? 'Text':'Password'" class="mt-2" /><strong>Show Password</strong>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Password" ControlToValidate="txtPass" SetFocusOnError="True" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                   </div>
               </div>
           </div>

           <div class="row mt-3 pb-5">
               <div class="col-md-4">
                   <asp:Button ID="btnLogin" runat="server" Text="Log In" CssClass="btn btn-secondary w-100" OnClick="btnLogin_Click"/>
               </div>
               <div class="col-md-8">
                   <strong>New Customer ?  </strong>
                   <asp:HyperLink ID="signUp" runat="server" CssClass="text-danger" NavigateUrl="SignUpPage.aspx">Sign Up</asp:HyperLink>
               </div>
           </div>

       </div>
   </section>

</asp:Content>
