<%@ Page Title="" Language="C#" MasterPageFile="~/Default/defaultMaster.Master" AutoEventWireup="true" CodeBehind="SignUpPage.aspx.cs" Inherits="KIA.Default.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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

    <section class="pt-5 ms-auto mt-5" id="signIn">
        <div class="container w-50 border border-dark mt-3 mb-3">
            <div class="row mt-2">
                <div class="col-md-12">
                    <h1 class="text-center display-1 fw-bolder pb-5 border-bottom border-dark"><strong>Sign Up</strong></h1>
                </div>
            </div>
            <div class="row mt-3 py-3">
                <div class="col-md-12">
                    <div class="input-group">
                        <span class="input-group-text">Name</span>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control border-none" placeholder="Enter Your Name"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Name" ForeColor="Red" ControlToValidate="txtName" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="row mt-3 py-3">
                <div class="col-md-12">
                    <div class="input-group">
                        <span class="input-group-text">Email</span>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control border-none" placeholder="Enter Your Email" TextMode="Email"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Email." ForeColor="Red" ControlToValidate="txtEmail" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Incorrect Email." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RegularExpressionValidator>
                </div>
            </div>


            <div class="row mt-3 py-3">
                <div class="col-md-12">
                    <div class="input-group">
                        <span class="input-group-text">Password</span>
                        <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" placeholder="Enter Your Password" TextMode="Password"></asp:TextBox>
                    </div>
                    <input type="checkbox" onchange="document.getElementById('<%= txtPass.ClientID %>').type=this.checked ? 'Text':'Password'" class="mt-2" /><strong>Show Password</strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Password." ForeColor="Red" ControlToValidate="txtPass" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="row mt-3 py-3">
                <div class="col-md-12">
                    <div class="input-group">
                        <span class="input-group-text">Confirm Password</span>
                        <asp:TextBox ID="txtConfPass" runat="server" placeholder="Re-Enter Password" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    </div>
                    <input type="checkbox" onchange="document.getElementById('<%= txtConfPass.ClientID %>').type=this.checked ? 'Text':'Password'" class="mt-2" /><strong>Show Password</strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Re-Enter Password." Display="Dynamic" ControlToValidate="txtConfPass" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Password Mismatch." ForeColor="Red" Display="Dynamic" ControlToCompare="txtPass" ControlToValidate="txtConfPass" SetFocusOnError="true"></asp:CompareValidator>
                </div>
            </div>

            <div class="row mt-3 py-3">
                <div class="col-md-12">
                    <div class="input-group">
                        <span class="input-group-text">Contact No.</span>
                        <asp:TextBox ID="txtContact" runat="server" placeholder="Enter Contact Number" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Contact Number" ForeColor="Red" ControlToValidate="txtContact" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator
                        ID="revMobileNumber"
                        runat="server"
                        ControlToValidate="txtContact"
                        ErrorMessage="Invalid mobile number. Enter a 10-digit number starting with 6, 7, 8, or 9."
                        ValidationExpression="^[6-9]\d{9}$"
                        ForeColor="Red">
</asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="row mt-3 py-3">
                <div class="col-md-1 d-flex align-item-center">
                    <asp:CheckBox ID="check" runat="server"/>
                </div>
                <div class="col-md-11">
                    <p>I accept the <a href="#" onclick="showTermsModal(); return false;">Terms & Conditions</a> and <a href="#" onclick="showPolicyModal(); return false;">Privacy Policy</a>.</p>
                </div>
            </div>
            <div id="termsModal" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="closeTermsModal();">&times;</span>
                    <h2>Terms and Conditions</h2>
                    <hr />
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
                    <hr />
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

            <div class="row mt-3 pb-5 d-flex">
                <div class="col-md-4">

                    <asp:Button ID="btnLogin" runat="server" Text="Sign Up" CssClass="btn btn-secondary w-100 py-3" OnClick="btnLogin_Click" />
                </div>
                <div class="col-md-8 align-self-center">
                    <strong>Alreedy have an Account ?  </strong>
                    <asp:HyperLink ID="signUp" runat="server" CssClass="text-danger" NavigateUrl="~/Default/SignInPage.aspx">Log In</asp:HyperLink>
                </div>
            </div>

        </div>
    </section>
    <script>
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
