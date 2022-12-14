<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
    <!-- directive cua JSTL -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="" />
                    <meta name="author" content="" />
                    <title>Dashboard - Admin</title>

                    <!-- VARIABLES -->
                    <jsp:include page="/views/common/variables.jsp"></jsp:include>

                    <!-- CSS -->
                    <jsp:include page="/views/manager/layout/css.jsp"></jsp:include>

                </head>

                <body class="sb-nav-fixed">
                    <!-- HEADER -->
                    <jsp:include page="/views/manager/layout/header.jsp"></jsp:include>
                    <div id="layoutSidenav">
                        <div id="layoutSidenav_nav">
                            <!-- MENU -->
                            <jsp:include page="/views/manager/layout/menu.jsp"></jsp:include>
                        </div>
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid">
                                    <h1 class="mt-4">Dashboard</h1>
                                    <ol class="breadcrumb mb-4">

                                    </ol>
                                    <div class="row">

                                        <div class="col-xl-3 col-md-6">
                                            <div class="card bg-info text-white mb-4">
                                                <div class="card-body" style="color: white !important;">${dem} ??H ch???
                                                    x??c nh???n</div>
                                                <div
                                                    class="card-footer d-flex align-items-center justify-content-between">
                                                    <a class="small text-white stretched-link"
                                                        href="${base}/admin/orderConf">Chi ti???t</a>
                                                    <div class="small text-white"><i class="fas fa-angle-right"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-xl-3 col-md-6">
                                            <div class="card bg-warning text-white mb-4">
                                                <div class="card-body">${countProduct} s???n ph???m</div>
                                                <div
                                                    class="card-footer d-flex align-items-center justify-content-between">
                                                    <a class="small text-white stretched-link"
                                                        href="${base}/admin/list-product">Chi ti???t</a>
                                                    <div class="small text-white"><i class="fas fa-angle-right"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-3 col-md-6">
                                            <div class="card bg-success text-white mb-4">
                                                <div class="card-body">${countOrder} ????n h??ng</div>
                                                <div
                                                    class="card-footer d-flex align-items-center justify-content-between">
                                                    <a class="small text-white stretched-link"
                                                        href="${base}/admin/order">Chi ti???t</a>
                                                    <div class="small text-white"><i class="fas fa-angle-right"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-3 col-md-6">
                                            <div class="card bg-danger text-white mb-4">
                                                <div class="card-body">Doanh thu: <fmt:setLocale value = "vi_VN"/>
                                                    <fmt:formatNumber value = "${sum}" type ="NUMBER"/>  VN??</div>
                                                <div
                                                    class="card-footer d-flex align-items-center justify-content-between">
                                                    <a class="small text-white stretched-link" href="#">Chi ti???t</a>
                                                    <div class="small text-white"><i class="fas fa-angle-right"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <!-- <div class="col-xl-6">
                                            <div class="card mb-4">
                                                <div class="card-header">
                                                    <i class="fas fa-chart-area mr-1"></i>
                                                    Bi???u ????? doanh thu
                                                </div>
                                                <div class="card-body"><canvas id="myAreaChart" width="100%"
                                                        height="40"></canvas></div>
                                            </div>
                                        </div> -->

                                        <div class="col-xl-6">
                                            <div class="card mb-4">
                                                <div class="card-header">
                                                    <i class="fas fa-chart-bar mr-1"></i>
                                                    Bi???u ????? doanh thu theo s???n ph???m
                                                </div>
                                                <div class="card-body">
                                                    <canvas id="myChartByProduct"></canvas>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-xl-6">
                                            <div class="card mb-4">
                                                <div class="card-header">
                                                    <i class="fas fa-chart-bar mr-1"></i>
                                                    Bi???u ????? th???ng k?? s??? l?????ng s???n ph???m theo danh m???c
                                                </div>
                                                <div class="card-body" style="width: 80% ; height: auto;">
                                                    <canvas id="myChartCate" width="30%" height="auto"></canvas>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- <div class="col-xl-6">
                                            <div class="card mb-4">
                                                <div class="card-header">
                                                    <i class="fas fa-chart-bar mr-1"></i>
                                                    Bi???u ????? c???t
                                                </div>
                                                <div class="card-body"><canvas id="myBarChart" width="100%"
                                                        height="40"></canvas></div>
                                            </div>
                                        </div> -->


                                    </div>

                                    <div class="row">

                                        <div class="col-xl-6">
                                            <form action="">
                                                <div class="form-group">
                                                    <label for="">T??? th???i ??i???m : </label>
                                                    <input type="date" name="fromDate" class="form-control">
                                                </div>

                                                <div class="form-group">
                                                    <label for="">?????n th???i ??i???m : </label>
                                                    <input type="date" name="toDate" class="form-control">
                                                </div>
                                                <input type="submit" value="B??o c??o" class="btn btn-success">
                                            </form>
                                        </div>
                                    </div>

                                    <c:if test="${listSaleOrderByDate!=null}">
                                        <div class="card-header">
                                            <i class="fas fa-table mr-1"></i>
                                            K???t qu??? t??m ???????c
                                        </div>
                                        <table id="dtBasicExample" class="table table-striped table-bordered table-sm"
                                            cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th class="th-sm">M?? s???n ph???m

                                                    </th>
                                                    <th class="th-sm">T??n s???n ph???m

                                                    </th>
                                                    <th class="th-sm">???nh s???n ph???m

                                                    </th>
                                                    <th class="th-sm">Gi?? s???n ph???m

                                                    </th>
                                                    <th class="th-sm">S??? l?????ng b??n

                                                    </th>
                                                    <th class="th-sm">T???ng thu

                                                    </th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:forEach items="${listSaleOrderByDate}" var="prod">
                                                    <tr>
                                                        <td>${prod.productId}</td>
                                                        <td>${prod.productName}</td>
                                                        <td>
                                                            <img src="${base }/upload/${prod.productImage}"
                                                                class="img-fluid" alt="Image"
                                                                style="width: 80px; height: auto;">
                                                        </td>
                                                        <td> <fmt:setLocale value = "vi_VN"/>
                                                            <fmt:formatNumber value = "${prod.price}" type ="NUMBER"/> VN??</td>
                                                        <td>${prod.quantity}</td>
                                                        <td><fmt:setLocale value = "vi_VN"/>
                                                            <fmt:formatNumber value = "${prod.total}" type ="NUMBER"/> VN??</td>
                                                    </tr>
                                                </c:forEach>

                                            </tbody>

                                        </table>
                                    </c:if>



                                    <!-- <c:if test="${listSaleOrderByDate!=null}">
                                        <div class="row">
                                            <div class="card mb-4">
                                                <div class="card-header">
                                                    <i class="fas fa-table mr-1"></i>
                                                    K???t qu??? t??m ???????c
                                                </div>
                                                <div class="card-body">
                                                    <div class="table-responsive">
                                                        <table class="table table-bordered" id="dataTable" width="100%"
                                                            cellspacing="0">
                                                            <thead>
                                                                <tr>
                                                                    <th>M?? s???n ph???m</th>
                                                                    <th>T??n s???n ph???m</th>
                                                                    <th>???nh s???n ph???m</th>
                                                                    <th>Gi?? s???n ph???m</th>
                                                                    <th>S??? l?????ng b??n</th>
                                                                    <th>T???ng thu</th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                <c:forEach items="${listSaleOrderByDate}" var="prod">
                                                                    <tr>
                                                                        <td>${prod.productId}</td>
                                                                        <td>${prod.productName}</td>
                                                                        <td>
                                                                            <img src="${base }/upload/${prod.productImage}"
                                                                                class="img-fluid" alt="Image"
                                                                                style="width: 80px; height: auto;">
                                                                        </td>
                                                                        <td>${prod.price} VN??</td>
                                                                        <td>${prod.quantity}</td>
                                                                        <td>${prod.total} VN??</td>
                                                                    </tr>
                                                                </c:forEach>

                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if> -->

                                    <div class="card mb-4">
                                        <div class="card-header">
                                            <i class="fas fa-table mr-1"></i>
                                             S???n ph???m hot
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table class="table table-bordered" id="dataTable" width="100%"
                                                    cellspacing="0">
                                                    <thead>
                                                        <tr>
                                                            <th>M?? s???n ph???m</th>
                                                            <th>T??n s???n ph???m</th>
                                                            <th>???nh s???n ph???m</th>
                                                            <th>Gi?? s???n ph???m</th>
                                                            <th>Ti??u ?????</th>
                                                            <th>Danh m???c</th>
                                                            <th>S??? l?????ng t???n</th>
                                                        </tr>
                                                    </thead>
                                                    <!-- <tfoot>
                                            <tr>
                                                <th>M?? s???n ph???m</th>
                                                <th>T??n s???n ph???m</th>
                                                <th>???nh s???n ph???m</th>
                                                <th>Gi?? s???n ph???m</th>
                                                <th>Ti??u ?????</th>
                                                <th>Danh m???c</th>
                                            </tr>
                                        </tfoot> -->
                                                    <tbody>
                                                        <c:forEach items="${listHotProduct}" var="pro">
                                                            <tr>
                                                                <td>${pro.id}</td>
                                                                <td>${pro.title}</td>
                                                                <td>
                                                                    <img src="${base }/upload/${pro.avatar}"
                                                                        class="img-fluid" alt="Image"
                                                                        style="width: 80px; height: auto;">
                                                                </td>
                                                                <td><fmt:setLocale value = "vi_VN"/>
                                                                    <fmt:formatNumber value = "${pro.priceSale}" type ="NUMBER"/></td>
                                                                <td>${pro.shortDescription}</td>
                                                                <td>${pro.getCategories().getName()}</td>
                                                                <td>${pro.quantity}</td>
                                                            </tr>
                                                        </c:forEach>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </main>
                            <!-- Footer -->
                            <jsp:include page="/views/manager/layout/footer.jsp"></jsp:include>
                        </div>
                    </div>
                    <!-- JAVASCRIPT -->

                    <jsp:include page="/views/manager/layout/js.jsp"></jsp:include>

                    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

                    <script>

                        let cateLables = [], cateInfo = [];

                        <c:forEach items="${listCate}" var="cat">
                            cateLables.push('${cat.name}')
                            cateInfo.push('${cat.getProducts().size()}')
                        </c:forEach>

                        let proLables = [], proInfo = [];

                        <c:forEach items="${listProductTk}" var="pro">
                            proLables.push('${pro.productName}')
                            proInfo.push('${pro.total}')
                        </c:forEach>

                        window.onload = function () {
                            cateChart("myChartCate", cateLables, cateInfo)
                            proChart("myChartByProduct", proLables, proInfo)
                        }
                    </script>


                </body>

                </html>