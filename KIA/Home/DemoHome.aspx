<%@ Page Title="" Language="C#" MasterPageFile="~/Home/HomeMaster.Master" AutoEventWireup="true" CodeBehind="DemoHome.aspx.cs" Inherits="KIA.Home.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Css/MainHome.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid" id="firstPage" style="padding-right: 0; padding-left: 0;">
        <!-- Bootstrap Carousel -->
        <div id="carouselHome" class="carousel slide" data-bs-ride="carousel" data-bs-interval="12000">
            <!-- Indicators -->
            <div class="carousel-indicators">
                <asp:Repeater ID="rptIndicators" runat="server">
                    <ItemTemplate>
                        <button type="button" data-bs-target="#carouselHome" data-bs-slide-to="<%# Container.ItemIndex %>"
                            class="<%# Container.ItemIndex == 0 ? "active" : "" %>" aria-current="<%# Container.ItemIndex == 0 ? "true" : "false" %>" aria-label="Slide <%# Container.ItemIndex + 1 %>">
                        </button>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <!-- Carousel Inner -->
            <div class="carousel-inner">
                <asp:Repeater ID="rptCarousel" runat="server">
                    <ItemTemplate>
                        <div class="carousel-item <%# Container.ItemIndex == 5 ? "active" : "" %>">
                            <div class="ratio ratio-16x9" style="height:100vh;width:100vw; overflow:hidden; position:relative;">
                              
                                <video class="d-block img-fluid" autoplay playsinline muted loop preload="metadata" style="object-fit: cover; max-width: none; max-height:100%">
                                    <source src='<%# "/CarouselVideo/" + Eval("VdoName") %>' type="video/mp4" />
                                </video>
                                
                            </div>
                            <div class="carousel-caption mb-3">
                                <h1 class="fw-bolder"><%# Eval("Title") %></h1>
                                <h3 class="pb-5"><%# Eval("Description") %></h3>
                                <asp:HyperLink ID="MoreBtn" runat="server" NavigateUrl='<%# "../Default/CarDetails.aspx?Id=" + Eval("CarId") %>' BorderStyle="Solid" BorderColor="White" BackColor="#05141f" ForeColor="White" Text="View More" CssClass="text-decoration-none px-4 py-2 mb-3"></asp:HyperLink>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <!-- Carousel Controls -->
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselHome" data-bs-slide="prev">
                <span class="carousel-control-prev-icon border rounded-circle p-4" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselHome" data-bs-slide="next">
                <span class="carousel-control-next-icon border rounded-circle p-4" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

    </div>

  <section class="container-fluid" id="page2"  style="padding-right: 0; padding-left: 0;">
      <div class="container-fluid"  style="padding-right: 0; padding-left: 0;">
          <div class="row"  style="padding-right: 0; padding-left: 0; padding:0">
              <!-- Left Column: Main Image and Content -->
              <div class="col-lg-6" style="padding-right:0;">
                  <div class="position-relative">
                      <img class="img-fluid w-100"
                          src="../Images/BobyDeolKia.jpg"
                          alt="Kia Sonet The Urban Wilds">
                      <div class="img-cont position-absolute bottom-0 start-0 p-3 text-white">
                          <h3>Kia Sonet</h3>
                          <p class="mb-0">
                              Introducing the Kia Seltos HTK+ loaded with badass upgrades.<br>
                              <br>
                          </p>
                      </div>
                  </div>
              </div>

              <!-- Right Column: Links and Actions -->
              <div class="col-lg-6 mt-1" id="right" style="padding-left:0;">
                  <div class="row g-0">
                      <!-- Book a Test Drive -->
                      <div class="col-12 col-md-6 dark p-5">
                          <a href="../User/TestDrive.aspx" class="text-decoration-none">
                              <div class="text-center p-5 ">
                                  <img class="img-fluid w-50 mb-5"
                                      src="../Images/TestDriveImg.png"
                                      alt="Book a Test Drive">

                                  <h2 class="h5 mb-0" style="color: #05141f;"><strong>Book a Test Drive</strong></h2>
                              </div>
                          </a>
                      </div>
                      <!-- Book Online -->
                      <div class="col-12 col-md-6 light p-5">
                          <a href="#" class="text-decoration-none">
                              <div class="text-center p-5  rounded shadow-sm">
                                  <img class="img-fluid w-50 mb-5"
                                      src="../Images/GLobeImg.png"
                                      alt="Book Online">
                                  <h2 class="h5 mb-0" style="color: #fff;"><strong>Book Online</strong></h2>
                              </div>
                          </a>
                      </div>
                      <div class="col-12 col-md-6 light p-5">
                          <a href="#" class="text-decoration-none">
                              <div class="text-center p-5  rounded shadow-sm">
                                  <img class="img-fluid w-50 mb-5"
                                      src="../Images/Calculator.png"
                                      alt="EMI Calculator">
                                  <h2 class="h5 mb-0" style="color: #fff;"><strong>EMI Calculator</strong></h2>
                              </div>
                          </a>
                      </div>
                      <!-- Download Brochure -->
                      <div class="col-12 col-md-6 dark p-5">
                          <a href="../Default/TotalCars.aspx" class="text-decoration-none">
                              <div class="text-center p-5 ">
                                  <img class="img-fluid w-50 mb-5"
                                      src="../Images/BookImg.png"
                                      alt="View Total Cars">
                                  <h2 class="h5 mb-0" style="color: #05141f;"><strong>View Total Cars</strong></h2>
                              </div>
                          </a>
                      </div>
                  </div>
              </div>
          </div>
      </div>

  </section>

  <section id="page3" class="container-fluid pt-5">
      <div class="container py-5" id="about">
          <h1>About - Kia India</h1>
          <p>
              In April 2017, Kia India signed a memorandum of understanding (MOU) with the State Government of Andhra Pradesh,
      India, to build a new manufacturing facility at Anantapur District. Kia commenced mass production in August 2019
      and has an annual production capacity of approximately 300,000 units. In April 2021, Kia India reimagined itself
      in line with its new brand identity, “Movement that Inspires” aimed at offering customers meaningful experiences
      backed by innovative products and services. Under the new brand identity, Kia has set out to find ways to
      achieve new benchmarks and inspire consumers to be more and do more. Till date, Kia India has launched five
      vehicles for the Indian market – the Seltos, the Carnival, the Sonet, the Carens, and the EV6. Kia India has
      completed over 6.3 lakh dispatches from its Anantapur plant, including 5 lakh domestic sales and over 1.5 lakh
      exports. With over 2 lakh connected cars on Indian roads, it is among the connected Car leaders in the country.
      The brand has a widespread network of 339 touchpoints and is focused on strengthening its footprints across the
      country.
          </p>

          <h1 class="fs-2">About - Kia Corporation</h1>
          <p class="pb-5">
              Kia (<a href="www.kia.com">www.kia.com</a>) is a global mobility brand with a vision to create sustainable mobility solutions for
      consumers, communities, and societies around the world. Founded in 1944, Kia has been providing mobility
      solutions for more than 75 years. With 52,000 employees worldwide, a presence in more than 190 markets, and
      manufacturing facilities in six countries, the company today sells around three million vehicles a year. Kia is
      spearheading the popularization of electrified and battery electric vehicles and developing a growing range of
      mobility services, encouraging millions of people around the world to explore the best ways of getting around.
      The company's brand slogan – ‘Movement that inspires’ – reflects Kia’s commitment to inspire consumers through
      its products and services.
          </p>
      </div>
  </section>

  <section id="page4">
      <div class="container py-5 text-center">
          <h5 class="text-danger">GIVING BACK</h5>
          <h1>Inspired by our community.</h1>
          <div class="container">
              <div id="accordion">

                  <div class="card">
                      <div class="card-header">
                          <a class="btn" data-bs-toggle="collapse" href="#collapseOne">
                              <h3>Sustainability Report</h3>
                              <p>
                                  MOVE – our annual sustainability report, stands for movement toward bringing about positive changes
                in the world. Since 2003, Kia has been publishing this report to inform its stakeholders of the
                company’s progress in sustainable growth, and to demonstrate its ongoing commitment towards practicing
                and advancing sustainability management.
                              </p>
                          </a>
                      </div>
                      <div id="collapseOne" class="collapse show" data-bs-parent="#accordion">
                          <div class="card-body">
                              <img
                                  src="../Images/CommunityImg1.jpg"
                                  alt="" class="d-block w-100 img-fluid">
                          </div>
                      </div>
                  </div>

                  <div class="card ">
                      <div class="card-header">
                          <a class="collapsed btn" data-bs-toggle="collapse" href="#collapseTwo">
                              <h3>Green Light Project</h3>

                              <p>
                                  'The Kia Green Light Project Initiative' is designed to promote the rights of people to education and
                health while boosting the self-reliance of local communities. Kia India started corporate social
                responsibility program in India with a two-week volunteer program in Anantapur District, in the state
                of Andhra Pradesh.
                              </p>
                          </a>
                      </div>
                      <div id="collapseTwo" class="collapse" data-bs-parent="#accordion">
                          <div class="card-body">
                              <img
                                  src="../Images/CommunityImg2.jpg"
                                  alt="" class="d-block w-100 img-fluid">
                          </div>
                      </div>
                  </div>

                  <div class="card ">
                      <div class="card-header">
                          <a class="collapsed btn" data-bs-toggle="collapse" href="#collapseThree">
                              <h3>Eco- Friendly Monitor
                              </h3>
                              <p>
                                  With a comprehensive environmental management philosophy always in mind, Kia has specified and
                evaluated an environmental goal for each workplace in order to achieve our ultimate goal of minimizing
                energy consumption/greenhouse gas emissions.
                              </p>
                          </a>
                      </div>
                      <div id="collapseThree" class="collapse" data-bs-parent="#accordion">
                          <div class="card-body">
                              <img
                                  src="../Images/CommunityImg3.jpg"
                                  alt="" class="d-block w-100 img-fluid">
                          </div>
                      </div>
                  </div>

              </div>
          </div>
      </div>
  </section>

  <section class="page5" id="contactUs">
      <div class="container-fluid">
          <div class="row">
              <div class="col-lg-6 col-md-12 col-sm-12 col-12" id="leftContact">
                  <div class="container text-center">
                      <h1 class="fw-bolder mt-5">Contact Us</h1>
                      <p class="fw-semibold my-5 px-5">
                          Your satisfaction is of primary importance to us. If you have any question
            or comment about Kia please put in a request and we will address it as quickly and efficiently as
            possible.
                      </p>
                      <p class="fw-normal my-5 px-5">
                          You Can Also Call us at: <a href="#">1800-108-5000</a>
            Or Email: <a href="kiacare@kiaindia.net">kiacare@kiaindia.net</a>
                      </p>
                      <p class="my-5">
                          For Corporate/Government/Fleet bulk orders please write to us at
            - <a href="institutionalsales@kiaindia.net">institutionalsales@kiaindia.net</a>
                      </p>
                  </div>
              </div>
              <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                  <div class="container mt-5">
                      <hr class="border border-dark">
                      <h5 class="fw-bold text-center mt-4 mb-4">Tell Us How to Reach You.</h5>
                      <div class="form">
                          <div class="row">
                              <div class="form-floating mb-3 col-md-6 col-sm-12 col-12 col-lg-6">
                                  <input type="text" id="Fname" class="form-control" placeholder="Enter Name">
                                  <label for="Fname">First Name</label>
                              </div>
                              <div class="form-floating mb-3 col-md-6 col-sm-12 col-12 col-lg-6">
                                  <input type="text" id="Lname" class="form-control" placeholder="Enter Last Name">
                                  <label for="Lname">Last Name</label>
                              </div>
                              <div class="form-floating mb-3 col-md- 6 col-sm-12 col-12 col-lg-6">
                                  <input type="email" id="email"
                                      class="form-control" placeholder="Enter Email">
                                  <label for="email">Email</label>
                              </div>
                              <div class="form-floating mb-3 col-md- 6 col-sm-12 col-12 col-lg-6">
                                  <input type="text" id="Contact"
                                      class="form-control" placeholder="Enter Contact No.">
                                  <label for="Contact">Contact No.</label>
                              </div>
                              <hr class="border-bottom border-dark  mt-5 mb-4">
                              <p class="fw-bold text-center mb-5">Submit a Question or Comment</p>
                              <div class="form-floating mb-3 col-md-12">
                                  <textarea class="form-control"  id="Comments" placeholder="Enter Message" style="height: 200px;"></textarea>
                                  <label for="Comments">Add a message..</label>
                              </div>
                              <p class="fw-lighter ps-5" style="width: 600px;"><span><i class="ri-information-line"></i></span>By clicking "Submit" I agree to be contacted at the number provided with more information or offers about Kia products. I understand these calls or texts may use computer-assisted dialing or pre-recorded messages. This consent is not a condition of purchase. You must complete all entries before the Submit button becomes active.</p>
                              <div class="col-md-12 mb-5 text-center">
                                  <button type="submit" class="btn px-5 py-3 btn-secondary text-white fw-medium mb-5">Submit</button></div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </section>

</asp:Content>
