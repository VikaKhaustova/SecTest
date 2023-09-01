<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Prog.kiev.ua</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous"></script>
</head>
<body>
<div align="center">
    <h1>Secret page for admins only!</h1>
    <p>Click to go back: <a href="/">back</a></p>

    <p>Click to logout: <a href="/logout">LOGOUT</a></p>

    <button type="button" id="add_user">Add</button>
    <button type="button" id="delete_user">Delete</button>

    <table border="1">
        <c:forEach items="${users}" var="user">
            <tr>
                <td><input type="checkbox" name="toDelete" value="${user.id}" id="check_${user.id}"></td>
                <td><c:out value="${user.login}"/></td>
                <td><c:out value="${user.role}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.phone}"/></td>
                <td><c:out value="${user.address}"/></td>
            </tr>
        </c:forEach>
    </table>
    <form class="form" id="form" action="/updateByAdmin" method="post">
        <br>
        Login:<br>
        <select name="login">
            <c:forEach items="${users}" var="user">
                <option value="${user.login}" >${user.login}</option>
            </c:forEach>
        </select><br>
        E-mail:<br/><input type="text" name="email" value="${email}"/><br/>
        Phone:<br/><input type="text" name="phone" value="${phone}"/><br/>
        Address:<br/><input type="text" name="address" value="${address}"/><br/>
        <button type="submit" value="${user.login}">UPDATE</button>
    </form>
</div>

<script>
    $('#add_user').click(function(){
        window.location.href = "/register";
    });

    $('#delete_user').click(function(){
        var data = { 'toDelete' : []};
        $(":checked").each(function() {
            data['toDelete'].push($(this).val());
        });
        $.post("/delete", data, function(data, status) {
            window.location.reload();
        });
    });
</script>

</body>
</html>
