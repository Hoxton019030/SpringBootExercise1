<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import the taglib  spring form, we can use the spring form in jsp 我們要用Spring的form表單-->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/standard/taglibs-impl-2.0.0.jar" prefix="jstl"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/standard/taglibs-impl-2.0.0.jar" prefix="fmt"%>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
   
<meta charset="UTF-8">
<title>Ajax Page</title>
</head>
<body>

<jsp:include page="../layout/navbar.jsp"></jsp:include>
<div class="container">
<h1>Ajax Page</h1>
<form id="msgForm" action="#">
 <input id="myMessage" type="text" required>
 <button id="submitBtn">Submit</button>
</form>


<div>
    <table class="mytable" id="list_table_json">
        <thead>
            <tr>
                <th>Message Content</th>
                <th>Message Time</th>
            </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>

</div>

<script src="${contextRoot}/js/jquery-3.6.4.js"></script>
<script>

    $(document).ready(function(){
        $('#submitBtn').click(function(event){
            event.preventDefault();
            let inputText = document.getElementById('myMessage').value;
            let dtoObject = {"text":inputText};
            let dtoJsonString = JSON.stringify(dtoObject);

            $.ajax({
                url:'http://localhost:8081/my-app/api/message/post',
                contentType:"application/json;charset=UTF-8",
                dataType: 'json',
                method:'post',
                data:dtoJsonString,
                success:function(result){
                 console.log(result)
                 
                 msg_data = '<tbody>';
                 $.each(result.content,function(index,value){
                    msg_data += '<tr>'
                    msg_data += '<td>' + value.text + '</td>'
                    msg_data += '<td>' + value.added + '</td>'
                    msg_data += '</tr>'
                 })
                 msg_data += '</tbody>';

                 let myTable = document.getElementById('list_table_json');
                 myTable.getElementsByTagName('tbody')[0].innerHTML = msg_data

                },
                error:function(err){
                    console.log(err)
                }
            })
        })
    })
</script>


</body>
</html>