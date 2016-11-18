<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="registration.User" %>
<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="en">
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </head>
    <body>
        <%
          List<User> users = ObjectifyService.ofy()
                                              .load()
                                              .type(User.class)
                                              .limit(5)
                                              .list();

            if (users.isEmpty()) {
        %>
        <p><h2>There are no registered users</h2></p>
        <%
            } else {
        %>
        <p><h2>Recently registered users</h2> </p>

        <table class="table table-striped">
            <thead>
                <th>Id</th>
                <th>userName</th>
                <th>Email</th>
            </thead>
            <tbody>
            <%
                for (User user : users) {

            %>
             <tr>
                <td><% out.print(user.id); %></td>
                <td><% out.print(user.userName); %></td>
                <td><% out.print(user.email); %></td>
            </tr>
        <%
                }
        %>
            </tbody>
                  </table>
        <%
            }
        %>
        Podaj dane do Rejestracji :<br><br>
        <div class="col-md-4">
            <form method="POST" action="/register">
              <div class="form-group">
                <label for="userSurname">userName</label>
                <input type="text" class="form-control" id="userSurname" name="surname" placeholder="Enter surname" required>
              </div>
              <div class="form-group">
                <label for="userEmail">Email address</label>
                <input type="email" class="form-control" id="userEmail" name="email" placeholder="Enter email" required>
              </div>
              <div class="form-group">
                <label for="userPassword">Password</label>
                <input type="password" class="form-control" id="userPassword" name="password" title="Password must contain at least 8 characters, including upper and lowercase letter, number or special character" placeholder="Enter password" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" required>
              </div>
              <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </body>
</html>