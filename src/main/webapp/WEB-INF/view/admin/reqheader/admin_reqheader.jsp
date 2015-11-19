<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><la:message key="labels.admin_brand_title" /> | <la:message
		key="labels.request_header_configuration" /></title>
<jsp:include page="/WEB-INF/view/common/admin/head.jsp"></jsp:include>
</head>
<body class="skin-blue sidebar-mini">
	<div class="wrapper">
		<jsp:include page="/WEB-INF/view/common/admin/header.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/view/common/admin/sidebar.jsp">
			<jsp:param name="menuCategoryType" value="crawl" />
			<jsp:param name="menuType" value="requestHeader" />
		</jsp:include>
		<div class="content-wrapper">
			<section class="content-header">
				<h1>
					<la:message key="labels.request_header_configuration" />
				</h1>
				<jsp:include page="/WEB-INF/view/common/admin/crud/breadcrumb.jsp"></jsp:include>
			</section>
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<c:if test="${!displayCreateLink}">
							<la:link href="../webconfig/" styleClass="btn btn-primary">
								<la:message key="labels.request_header_create_web_config" />
							</la:link>
						</c:if>
						<c:if test="${displayCreateLink}">
							<div class="box box-primary">
								<%-- Box Header --%>
								<div class="box-header with-border">
									<jsp:include page="/WEB-INF/view/common/admin/crud/header.jsp"></jsp:include>
								</div>
								<%-- Box Body --%>
								<div class="box-body">
									<%-- Message --%>
									<div>
										<la:info id="msg" message="true">
											<div class="alert alert-info">${msg}</div>
										</la:info>
										<la:errors />
									</div>
									<%-- List --%>
									<c:if test="${requestHeaderPager.allRecordCount == 0}">
										<p class="callout callout-info">
											<la:message key="labels.list_could_not_find_crud_table" />
										</p>
									</c:if>
									<c:if test="${requestHeaderPager.allRecordCount > 0}">
										<table class="table table-bordered table-striped">
											<thead>
												<tr>
													<th><la:message key="labels.request_header_list_name" /></th>
													<th><la:message
															key="labels.request_header_list_web_crawling_config" /></th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="data" varStatus="s"
													items="${requestHeaderItems}">
													<tr class="${s.index % 2 == 0 ? 'row1' : 'row2'}"
														data-href="${contextPath}/admin/requestheader/details/4/${f:u(data.id)}">
														<td>${f:h(data.name)}</td>
														<td>${f:h(data.webConfig.name)}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<c:set var="pager" value="${requestHeaderPager}"
											scope="request" />
										<c:import url="/WEB-INF/view/common/admin/crud/pagination.jsp" />
									</c:if>
								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.box -->
						</c:if>
					</div>
				</div>
			</section>
		</div>
		<jsp:include page="/WEB-INF/view/common/admin/footer.jsp"></jsp:include>
	</div>
	<jsp:include page="/WEB-INF/view/common/admin/foot.jsp"></jsp:include>
</body>
</html>