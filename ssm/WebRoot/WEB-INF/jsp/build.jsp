<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextpath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=750,user-scalable=no">
        <link rel="stylesheet" href="${contextpath}/theme/css/Mreset.css" />
        <link rel="stylesheet" href="${contextpath}/theme/css/search.css">
        <link rel="stylesheet" href="${contextpath}/theme/css/jquery-ui.css">
        <script src="${contextpath}/theme/js/jquery.min.js"></script>
        <script src="${contextpath}/theme/js/jquery-ui.js"></script>
        <title></title>
    </head>
    <body>
        <section>
            <div class="searchContent">
                <div class="areaSelect">
                    <i><img src="${contextpath}/theme/img/down-arrow.png"></i>                
                    <select id="status">
                        <option value="不限">不限</option>
                        <option value="黄浦">黄浦区</option>
                        <option value="徐汇">徐汇区</option>
                        <option value="长宁">长宁区</option>
                        <option value="静安">静安区</option>
                        <option value="普陀">普陀区</option>
                        <option value="虹口">虹口区</option>
                        <option value="杨浦">杨浦区</option>
                        <option value="浦东新区">浦东新区</option>
                        <option value="闵行">闵行区</option>
                        <option value="宝山">宝山区</option>
                        <option value="嘉定">嘉定区</option>
                        <option value="金山">金山区</option>
                        <option value="松江">松江区</option>
                        <option value="青浦">青浦区</option>
                        <option value="奉贤">奉贤区</option>
                        <option value="崇明">崇明县</option>
                    </select>
                </div>
                <input type="text" class="nameInput" id="tags" placeholder="请输入楼宇名或地址"/>
                <span class="btn-search">搜索</span>                
            </div>
            <div class="noSearch">
                <img src="${contextpath}/theme/img/location.png" alt="" />
                <p>选择行政区域并输入楼宇名或地址</p>
            </div>
            <div class="noData" style="display: none;">
                <img src="${contextpath}/theme/img/noresult.png" alt=""/>
                <p>暂无结果</p>
            </div>        
            <div class="data" style="display: none;">
	            <table width="100%">
	                <thead>
	                    <td width="120px" height="45px">行政区域</td>
	                    <td width="235px" height="45px">建筑名称</td>
	                    <td height="45px">楼宇地址</td>
	                </thead>
	                
	                <tbody>
	                <c:forEach var="build" items="${builds}">
	                <tr>
	                        <td>${build.unitArea}</td>
	                        <td>${build.unitBuildName}</td>
	                        <td>${build.unitBuildLocation}</td>
	                 </tr>
	                
	                </c:forEach>
	                    <!-- <tr>
	                        <td>浦东新区</td>
	                        <td>上海白玉兰烟草材料有限责任公司海白玉兰烟草材料有限责任公司海白玉兰烟草材料有限责任公司</td>
	                        <td>浦东新区张江路1406弄49号</td>
	                    </tr>   -->                                                                         
	                </tbody>
	            </table>
            </div>
        </section>
        <input id="buildarea" type="hidden" value="${buildarea}" />
        <input id="searchClick" type="hidden" value="${searchClick}" />
        <input id="searchvalue" type="hidden" value="${searchvalue}" />
    </body>
    <script type="text/javascript">
    
    $(function() {
		var buildarea = $("#buildarea").val();
		var builds = ${not empty builds};
		var searchClick = $("#searchClick").val();
		var searchvalue = $("#searchvalue").val();
		if(buildarea) {
			$("#status").val(buildarea);
		} else {
			$("#status").val("浦东新区");
		}
		if(searchvalue) {
			$(".nameInput").val(searchvalue);
		}
		
		if(searchClick) {
			// 搜索按钮点击之后
			if(builds) {
				// 有数据
				$(".noSearch").hide();
				$(".noData").hide();
				$(".data").show();
			} else {
				// 无数据
				$(".noSearch").hide();
                $(".noData").show();
                $(".data").hide();
			}
			
		} else {
			// 没点击
			$(".noSearch").show();
            $(".noData").hide();
            $(".data").hide();
		}
		// Jquery-ui 插件实现联想搜索功能
		var availableTags =  eval(${searchData});
		$("#tags").autocomplete({
		   source: availableTags
		});
		
	});
    
    $("select#status").change(function(){
    	var buildArea = $(this).val();
    	location.href="${contextpath}/XCYY/showBuild?buildarea=" + buildArea;
    });
    
    $(".btn-search").click(function () {
    	var buildArea = $("#status").val();
    	var searchValue = $(".nameInput").val();
    	location.href="${contextpath}/XCYY/search?buildarea=" + buildArea + "&searchvalue=" + searchValue;
    })
    
    </script>
</html>