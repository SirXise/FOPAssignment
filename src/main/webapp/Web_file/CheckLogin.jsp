<%@ page language="java" import="java.sql.*"%><b>

        <%

            String name = request.getParameter("ID");

            String pass = request.getParameter("Password");

            try {

                Class.forName("com.mysql.jdbc.Driver");

                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/maya2.0", "root", "");

                Statement st = con.createStatement();

                ResultSet rs = st.executeQuery("select * from mayausers");

                int x = 0;

                while (rs.next()) {

                    if ((rs.getString("ID").equals(name)) && rs.getString("Password").equals(pass)) {

                        String stp = rs.getString("Status");

                        if (stp.equals("Staff")) {

                            x = 1;

                            break;

                        } else {

                            x = 2;

                            break;

                        }

                    }

                }

                if (x == 2) {

                    response.sendRedirect("StudentHome.jsp");

                } else if (x == 1) {

                    response.sendRedirect("StaffHome.jsp");

                } else {

                        out.println("Either you enter Invalid UserName or Password! Please Try Again");

        %>

    <jsp:include page="Login.jsp" />

        <%}

            } catch (Exception e) {

                out.println(e);

            }

            session.setAttribute("ID", name);

        %>
