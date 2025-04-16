<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddShowRoom.aspx.cs" Inherits="KIA.Admin.WebForm10" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="" id="addShowroom">
        <div class="container-fluid mt-5 pt-5">
            <div class="row">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="col-lg-5 col-md-12 col-sm-12 col-12" id="leftContact" style="background-color: #eff1f2;">
                            <div class="container text-center">
                                <h1 class="fw-bolder mt-5 display-3">New Show Room</h1>
                                <p class="fw-semibold my-5 px-5">
                                    Add new ShowRoom.
                                </p>

                                <div class="mb-4">
                                    <p class="fw-bold">Choose State</p>
                                    <asp:DropDownList ID="DdState" runat="server" CssClass="p-3 px-5"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Choose State." ControlToValidate="DdState" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-7 col-md-12 col-sm-12 col-12">
                            <div class="container mt-5">
                                <p class="mt-5 fw-medium">All fields are required.</p>
                                <hr class="border border-dark">

                                <div class="form">


                                    <h5 class="fw-bold mb-5">Set Your Location to see nearby Showroom,</h5>

                                    <div class="row d-flex flex-column justify-content-around">
                                   
                                        <div class=" mb-3 col-lg-5">
                                            <label>City:</label>
                                            <asp:DropDownList ID="DdCity" runat="server" CssClass="p-3 px-5" AutoPostBack="true"></asp:DropDownList>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chose City" ForeColor="Red" SetFocusOnError="true" ControlToValidate="DdCity" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="row">
                                        <div class=" mb-3 col-lg-6 col-sm-12">
                                            <label>Showroom</label>
                                            <asp:DropDownList ID="ChooseShowroom" runat="server" CssClass="p-3 px-5" AutoPostBack="true"></asp:DropDownList>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Choose Showroom." ForeColor="Red" ControlToValidate="ChooseShowroom" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>


                                    <hr class="border border-dark" />
                                    <h5 class="fw-bold">Select Date and Time.</h5>

                                    <div class="col-md-12 col-lg-7">
                                        <asp:TextBox ID="txtDate" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Date and Time required" ControlToValidate="txtDate" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>


                                    <div class="col-md-12 mb-5 text-center">
                                        <asp:Button ID="btnAdd" runat="server" Text="Request" class="btn px-5 py-3 btn-secondary text-white fw-medium mb-5" />
                                    </div>
                                </div>
                            </div>
                            </div>
                        
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            </div>
    </section>

</asp:Content>
