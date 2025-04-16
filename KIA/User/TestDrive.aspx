<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="TestDrive.aspx.cs" Inherits="KIA.User.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Test Drive</title>
    <style>
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }

        /* Modal Content */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
            text-align: center;
        }

        /* Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="" id="testDrive">
        <div class="container-fluid mt-5 pt-5">
            <div class="row">
                <div class="col-lg-5 col-md-12 col-sm-12 col-12" id="leftContact" style="background-color: #eff1f2;">
                    <div class="container text-center">
                        <h1 class="fw-bolder mt-5 display-1">Test Drive</h1>
                        <p class="fw-semibold my-5 px-5">
                            Get a Test Drive Scheduled of your favourite car at your nearest Dealership.
                        </p>
                        <div class="mb-4">
                            <p class="fw-bold">Choose Your KIA.</p>
                            <asp:DropDownList ID="DpModel" runat="server" CssClass="p-3 px-5"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Choose Car Model." ControlToValidate="DpModel" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7 col-md-12 col-sm-12 col-12">
                    <div class="container mt-5">
                        <p class="mt-5 fw-medium">All fields are required.</p>
                        <hr class="border border-dark">

                        <div class="form">


                            <h5 class="fw-bold mb-5">Set Your Location to see nearby Showroom,</h5>
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="row">
                                        <div class=" mb-3">
                                            <label>State:</label>
                                            <asp:DropDownList ID="DdState" runat="server" OnSelectedIndexChanged="DdState_SelectedIndexChanged" CssClass="p-3" AutoPostBack="true"></asp:DropDownList>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Choose State" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ControlToValidate="DdState"></asp:RequiredFieldValidator>

                                        <div class=" mb-3 col-lg-5">
                                            <label>City:</label>
                                            <asp:DropDownList ID="DdCity" runat="server" OnSelectedIndexChanged="DdCity_SelectedIndexChanged" CssClass="p-3 px-5" AutoPostBack="true"></asp:DropDownList>
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
                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <hr class="border border-dark" />
                            <h5 class="fw-bold">Select Date and Time.</h5>

                            <div class="col-md-12 col-lg-7">

                                <asp:TextBox ID="txtDate" runat="server" TextMode="DateTimeLocal"></asp:TextBox>                               
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Date and Time required" ControlToValidate="txtDate" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>


                            <div class="row mt-3 py-3">
                                <div class="col-md-12">
                                    <asp:CheckBox ID="check" runat="server" />
                                    <span>I accept the <a href="#" onclick="showTermsModal(); return false;">Terms & Conditions</a> and <a href="#" onclick="showPolicyModal(); return false;">Privacy Policy</a>.</span>
                                </div>
                            </div>

                            <div id="termsModal" class="modal">
                                <div class="modal-content">
                                    <span class="close" onclick="closeTermsModal();">&times;</span>
                                    <h2>Terms and Conditions</h2>
                                    <hr class="border-bottom border-dark" />
                                    <h3 class="text-start">Introduction</h3>
                                    <p>
                                        <!-- Include your terms and conditions here -->
                                        You are requested to read these terms and conditions carefully before accessing this website or other sites owned, hosted and maintained by Kia India Private Ltd. (‘KIN/us/we/our’), collectively referred to as ‘Website’.
             These Terms and Conditions (the “T&C”) constitute a valid and binding agreement between KIN and the user (‘You/Your’). By using the Website, per se, You agree to be bound by all the terms and conditions as mentioned herein. 
             The following terms and conditions and any amendments or modifications made thereto, govern the use of the Website and any content made available from or through the Website.By accessing the Website, You warrant that You 
             have fully read and understood these T&C and agree to be legally bound by these terms and acknowledge unconditional acceptance without limitation or qualification of these T&C. We may change these T&C at any time without any
             prior notice in writing or otherwise to You, by posting changes on the Website. You may review these terms regularly to ensure that You are aware of any changes made by us. The continued use of our Website by You, after changes
             are posted means that You agree to be legally bound by these T&C as updated and/or amended. In the case of any violation of these T&C or any additional terms posted on Website, we reserve the right to seek all remedies available
             by law and in equity for such violations..
                                    </p>
                                </div>
                            </div>

                            <div class="modal" id="policyModal">
                                <div class="modal-content">
                                    <span class="close" onclick="closePolicyModal();">&times;</span>
                                    <h2>Privacy Policy</h2>
                                    <hr class="border-bottom border-dark" />
                                    <h3 class="text-start">Introduction</h3>
                                    <p>
                                        This Privacy Policy (“Privacy Policy”) is intended to provide users of this website or other sites of the Company (defined hereinafter) collectively referred to as “Website” with clear and complete information about the data
                                          and information that the Company collects in connection with usage of the Website by the users and the way that data and information is stored and used.
                                        This Privacy Policy applies to the Website and the services available through the Website which is owned, hosted and maintained by KIA India Private Limited and its affiliates (“the Company” or “We” or “Us” or “Ourselves”)
                                              having its registered office at NH-44. S.Y.NO.151-2, Erramanchi, Penukonda Mandal, Anantpur, Andhra Pradesh 515164. All the content provided on the Website is general content for informational purpose only (“Content”). We are
                                            committed to protect the privacy and information of the users who use and/or register on the Website (“User” or “Users” or “You”). This Privacy Policy outlines the usage policies and practices that apply to the Website and also 
                                    sets forth what all information and/or database the Website gathers (categorized as mandatory or optional) and how We collect, use, hold, share and protect such information collected from the Users of the Website.
             Please review the Privacy Policy carefully so that You understand Our privacy practices. In case You have any queries or concerns regarding this Privacy Policy, You should contact us by email at hello@kia-motors.in.
                                    </p>
                                </div>
                            </div>

                            <div class="col-md-12 mb-5 text-center">
                                <asp:Button ID="btnRequest" runat="server" Text="Request" class="btn px-5 py-3 btn-secondary text-white fw-medium mb-5" OnClick="btnRequest_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <script>

        <%--document.addEventListener("DOMContentLoaded", function () {
            var today = new Date().toISOString().split('T')[0];
            document.getElementById('<%= txtDate.ClientID %>').setAttribute('min', today);
         });--%>

        function showTermsModal() {
            var modal = document.getElementById("termsModal");
            modal.style.display = "block";
        }

        function closeTermsModal() {
            var modal = document.getElementById("termsModal");
            modal.style.display = "none";
        }

        // Close the modal when the user clicks anywhere outside it
        window.onclick = function (event) {
            var modal = document.getElementById("termsModal");
            if (event.target == modal) {
                modal.style.display = "none";
            }
        };

        function showPolicyModal() {
            var modal = document.getElementById("policyModal");
            modal.style.display = "block";
        }

        function closePolicyModal() {
            let modal = document.getElementById("policyModal");
            modal.style.display = "none";
        }
        // Close the modal when the user clicks anywhere outside it

        window.onclick = function (event) {
            var modal = document.getElementById("policyModal");
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

    </script>
</asp:Content>
