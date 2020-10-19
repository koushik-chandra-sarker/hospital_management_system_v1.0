<%@ page import="DAO.UserDAO" %>
<%@ page import="Helper.ConnectionProvider" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.List" %>

<%
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    UserDAO dao = new UserDAO(ConnectionProvider.getConnection());
    PrintWriter printWriter = response.getWriter();
    List<String> usernames = dao.getAllUsername();
    Gson gson = new Gson();
    String usernameList = gson.toJson(usernames);
    printWriter.write(usernameList);
    response.flushBuffer();

%>
