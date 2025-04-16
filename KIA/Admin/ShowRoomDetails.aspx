<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ShowRoomDetails.aspx.cs" Inherits="KIA.Admin.WebForm11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid mt-5 pt-5">

        <div class="row">
            <div class="col-lg-4 col-md-12 col-sm-12 col-12" id="leftContact" style="background-color: #eff1f2;">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="container text-center">
                            <h1 class="fw-bolder mt-5 display-3">Show Rooms</h1>
                            <p class="fw-semibold my-5 px-5">
                                Search your Show Room Here. 
                            </p>
                            <div class="mb-4">
                                <p class="fw-bold">Choose State.</p>
                                <asp:DropDownList ID="DdState" runat="server" CssClass="px-5" Width="250px" OnSelectedIndexChanged="DdState_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Choose State." ControlToValidate="DdState" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                <p class="fw-bold">Choose City.</p>
                                <asp:DropDownList ID="DdCity" runat="server" CssClass="px-5"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Choose City." ControlToValidate="DdCity" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="text-center">
                    <asp:Button ID="btnSearch" runat="server" Text="Search" Width="180px" CssClass="btn btn-secondary mb-3" OnClick="btnSearch_Click" ValidationGroup="Submit" />
                </div>
            </div>

            <div class="col-lg-8 col-md-12 col-sm-12 col-12">
                <h1 class="text-center mt-5">Showroom List</h1>
                <div class="col-lg-12 col-md-12 col-sm-12 col-12 table-responsive">
                    <asp:Label runat="server" ID="lblMsg" Visible="false"></asp:Label>
                    <asp:GridView ID="GV_ShowRoom" runat="server" CssClass="table table-bordered table-hover table-striped table-sm" AllowPaging="true" PageSize="6" AutoGenerateColumns="false" OnPageIndexChanging="GV_ShowRoom_PageIndexChanging">
                        <Columns>
                            <asp:BoundField HeaderText="Name" DataField="Name" HeaderStyle-CssClass="bg-dark text-white text-center" ItemStyle-CssClass="text-center" />
                            <asp:BoundField HeaderText="Contact No." DataField="Contact" HeaderStyle-CssClass="bg-dark text-white text-center" ItemStyle-CssClass="text-center" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
