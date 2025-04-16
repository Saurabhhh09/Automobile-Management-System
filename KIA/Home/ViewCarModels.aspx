<%@ Page Title="" Language="C#" MasterPageFile="~/Home/HomeMaster.Master" AutoEventWireup="true" CodeBehind="ViewCarModels.aspx.cs" Inherits="KIA.Home.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>KIA Models</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid mt-5">
        <h1 class="fw-bolder display-2 pt-5 text-center">
            <asp:Label ID="lblCarType" runat="server" Text=""></asp:Label></h1>
        <div class="row my-3">

          

            <asp:DataList ID="DataListCarModel" runat="server" OnItemCommand="DataListCarModel_ItemCommand">
                <ItemStyle BackColor="#05141f" ForeColor="White" />
                <AlternatingItemStyle BackColor="White" ForeColor="Black" />
                <ItemTemplate>
                    <div class="row p-5">

                        <div class="col-lg-7 ps-5">
                            <asp:Image ID="ImgCar" runat="server" CssClass="img-fluid" ImageUrl='<%# "~/UploadImage/" + Eval("ImgPath") %>' Height="450px" />
                        </div>
                        <div class="col-lg-5 ps-5 pt-5">
                            <h1 class="text-danger ps-5 fw-normal"><%# Eval("Name") %></h1>

                            <h1 class="ps-5" style="line-height: 2.5rem;"><%# Eval("Description") %></h1>

                            <h5 class="ps-5 pt-4">Price: <%# Eval("Price", "{0:C}") %></h5>

                            <asp:Button ID="Btn" runat="server" Text="View More" CommandArgument='<%# Eval("Id") %>' CommandName="ViewMore" ForeColor="Black" BackColor="White" CssClass="px-5 py-4 ms-5 mt-5" />

                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
