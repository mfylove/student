<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="ch">

    <head>
        <meta charset="utf-8">

        <title>学生管理系统</title>
        
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/common.css" />
        <link rel="stylesheet" type="text/css" href="css/slide.css" />
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="css/flat-ui.min.css" />
        <link rel="stylesheet" type="text/css" href="css/jquery.nouislider.css">
    	<link rel="stylesheet" type="text/css" href="css/bootstrap-table.min.css">
    </head>

    <body>
        <div id="wrap">
         
            <div class="leftMeun" id="leftMeun">
                <div id="logoDiv">
                    <p id="logoP"><img id="logo" alt="学生管理项目" src="images/logo.png"><span>学生管理项目</span></p>
                </div>
                <div id="personInfor">
                    <p id="userName">${sessionUser.nickname }</p>                  
                    <p>
                        <a href="loginout.do">退出登录</a>
                    </p>
                </div>
               
                <div class="meun-title">管理</div>
                <div class="meun-item meun-item-active" href="#scho" aria-controls="scho" role="tab" data-toggle="tab"><img src="images/icon_user_grey.png">学生管理</div>
                <div class="meun-item" href="#chan" aria-controls="chan" role="tab" data-toggle="tab"><img src="images/icon_change_grey.png">修改密码</div>

            </div>
            <!-- 右侧具体内容栏目 -->
            <div id="rightContent">
                <a class="toggle-btn" id="nimei">
                    <i class="glyphicon glyphicon-align-justify"></i>
                </a>
                <!-- Tab panes -->
                <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="scho">

                <div class="check-div form-inline">
                    <div class="col-xs-3">
                        <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addSchool">添加学生 </button>
                    </div>
                   
                </div>
                <div class="data-div">
                    <div class="row tableHeader">
                    	<table id="mytable"></table>
                      
                    </div>
                   

                </div>
                <!--弹出添加用户窗口-->
                <div class="modal fade" id="addSchool" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">添加学生</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal" method="post" action="addStudent.do">
                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">姓名：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi" name="sname" placeholder="">
                                            </div>
                                        </div>                                      
                                        <div class="form-group">
                                            <label class="col-xs-3 control-label">性别：</label>
                                            <div class="col-xs-8 ">
                                                <%--<select name='ssex'>
	                                                <option>男</option>
	                                                <option>女</option>
                                                </select>--%>
                                                    <input type="text" class="form-control input-sm duiqi" name="ssex" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-xs-3 control-label">生日：</label>
                                            <div class="col-xs-8">
                                                <input type="date" class="form-control input-sm duiqi" name="birthday" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-xs-3 control-label">地址：</label>
                                            <div class="col-xs-8">
                                                <input type="text" class="form-control input-sm duiqi" name="address" placeholder="">
                                            </div>
                                        </div>
                                        <%--<input type="text">--%>
                                        <div class="modal-footer">
			                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
			                                <button type="submit" class="btn btn-xs btn-green">保 存</button>
                            			</div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->

                <!--弹出修改用户窗口-->
                <div class="modal fade" id="reviseSchool" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">修改信息</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal" method="post" action="modifyStudent.do">
                                        <input type="hidden" id="modifyid" name="id">
                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">姓名：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi" id="modifysname" name="sname" placeholder="">
                                            </div>
                                        </div>                                        
                                        <div class="form-group">
                                            <label class="col-xs-3 control-label">性别：</label>
                                            <div class="col-xs-8 ">
                                                <%--<select name='ssex'>
	                                                <option id='sex1'>男</option>
	                                                <option id='sex0'>女</option>
                                                </select>--%>
                                                    <input type="text" class="form-control input-sm duiqi" name="ssex" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-xs-3 control-label">生日：</label>
                                            <div class="col-xs-8">
                                                <input type="date" class="form-control input-sm duiqi" id="modifybirthday" name="birthday" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-xs-3 control-label">地址：</label>
                                            <div class="col-xs-8">
                                                <input type="text" class="form-control input-sm duiqi" id="modifyaddress" name="address" placeholder="">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
			                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
			                                <button type="submit" class="btn btn-xs btn-green">保 存</button>
                            			</div>
                                    </form>
                                </div>
                            </div>
                            
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->

                <!--弹出删除用户警告窗口-->
                <div class="modal fade" id="deleteSchool" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">提示</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    	确定要删除该学生？删除后不可恢复！
                                </div>
                            </div>
                            <div class="modal-footer">                                
                                <form action="removeStudent.do">
                                	<input type="hidden" id="delid" name="id">
                                	<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                	<button type="submit" class="btn btn-xs btn-danger">删除</button>
                                </form>
                                
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
				
            </div>  
            <!-- 修改密码模块 -->
            <div role="tabpanel" class="tab-pane" id="chan">
                <div class="check-div">
                    	修改密码
                </div>
                <div style="padding: 50px 0;margin-top: 50px;background-color: #fff; text-align: right;width: 420px;margin: 50px auto;">
                    <form id="myform" class="form-horizontal" method="post" action="">
                        <input name="id" type="hidden" value="${sessionUser.id }">
                        <div class="form-group">
                            <label class="col-xs-4 control-label">原密码：</label>
                            <div class="col-xs-5">
                                <input type="password" name="password" class="form-control input-sm duiqi" placeholder="" style="margin-top: 7px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-4 control-label">新密码：</label>
                            <div class="col-xs-5">
                                <input type="password" name="newpassword" class="form-control input-sm duiqi" placeholder="" style="margin-top: 7px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-4 control-label">重复密码：</label>
                            <div class="col-xs-5">
                                <input type="password" name="repassword" class="form-control input-sm duiqi" placeholder="" style="margin-top: 7px;">
                            </div>
                        </div>
                        <div class="form-group text-right">
                            <div class="col-xs-offset-4 col-xs-5" style="margin-left: 169px;">
                                <button type="reset" class="btn btn-xs btn-white">取 消</button>
                                <button type="button" class="btn btn-xs btn-green" id="loginbtn">保存</button>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-5">
                                <font id="f1" color="red"></font>
                            </div>
                        </div>
                    </form>
                </div>

            </div>                           
        </div>
    </div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap-table.min.js"></script>
<script type="text/javascript" src="js/bootstrap-table-zh-CN.min.js"></script>
    <script>
            $(function() {
                $(".meun-item").click(function() {
                    $(".meun-item").removeClass("meun-item-active");
                    $(this).addClass("meun-item-active");
                    var itmeObj = $(".meun-item").find("img");
                    itmeObj.each(function() {
                        var items = $(this).attr("src");
                        items = items.replace("_grey.png", ".png");
                        items = items.replace(".png", "_grey.png")
                        $(this).attr("src", items);
                    });
                    var attrObj = $(this).find("img").attr("src");
                    ;
                    attrObj = attrObj.replace("_grey.png", ".png");
                    $(this).find("img").attr("src", attrObj);
                });
            })
      </script>
      <script type="text/javascript">
     
      	var user = "${sessionUser }";
    	//alert(user);
		if(user==""){
			alert("请先登陆");
			location.href="login.do"
		}
		
      	$(function(){
			$("#mytable").bootstrapTable({
				columns: [{ field: 'id', title: '学号',sortable:true },
					{ field: 'sname', title: '姓名' },
					{ field: 'sage', title: '年龄' },
					{ field: 'ssex', title: '性别' },
					{ field: 'birthday', title: '生日' },
					{ field: 'address', title: '地址' },
					{ field: 'buttons', title: '操作',events: operateEvents, formatter: operateFormatter }],
				//data: [{ id: 1, sname: 'Item 1', sage: '21', ssex:'男', birthday:'1996-01-23', address:'江干' }]
				url: 'stuspage.do',
				method: 'post',
                pagination: true,

                sortOrder: "desc",
				pageList: [3, 4, 8, 10],
                search: true,
				pageNumber: 1,
				pageSize: 4,
				sidePagination: 'server'
			});      		
		});
      function operateFormatter(value,row,index) {
    	  return ["<button id='modify' class='btn btn-success btn-xs' data-toggle='modal' data-target='#reviseSchool'>编辑</button>&nbsp;&nbsp;<button id='del' class='btn btn-danger btn-xs' data-toggle='modal' data-target='#deleteSchool'>删除</button>"].join("");
	   }
      window.operateEvents = {
    		'click #modify': function (e, value, row, index) {
    			document.getElementById("modifyid").value=row.id;
    			document.getElementById("modifysname").value=row.sname;
                document.getElementById("sex").value=row.ssex;
    			/*if(row.ssex=="女"){
    				document.getElementById("sex0").selected="selected";
    				
    			}else{
    				document.getElementById("sex1").selected="selected";
    			}*/
    			
    			
    			//document.getElementById("modifyssex").value=row.ssex;
    			document.getElementById("modifybirthday").value=row.birthday;
    			document.getElementById("modifyaddress").value=row.address;
              
            },
            'click #del': function (e, value, row, index) {
            	document.getElementById("delid").value=row.id;            
            }         
      };
      	
      </script>
    <script>
        $(function(){

            $("#loginbtn").click(function(){

                var param = $("#myform").serialize();

                //alert(param);

                $.ajax({
                    url:"modifypassword.do",
                    data:param,
                    dataType:"text",
                    type:"post",
                    success:function(rec){
                        //alert(rec);
                        if(rec=="0"){
                            alert("密码修改成功,回到登陆界面")
                            location.href="loginout.do"
                        }
                        if(rec=="1"){
                            $("#f1").html("原密码不正确")
                        }
                        if(rec=="2"){
                            $("#f1").html("两次密码不一致")
                        }
                        if(rec=="3"){
                            $("#f1").html("新密码不能为空")
                        }
                    }

                });

            });

        })
    </script>
      
</body>

</html>