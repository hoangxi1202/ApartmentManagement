package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import dao.ServiceDAO;
import dto.UserDTO;
import entity.Service;
import java.util.List;

public final class employee_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>Employee Page</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        ");

            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
//            if (loginUser == null || !"EM".equals(loginUser.getRoleID())) {
//                response.sendRedirect("login.jsp");
//                session.setAttribute("ERROR_MESSAGE", "Please Login as employee!");
//                return;
//            }
            String search = (String) request.getParameter("search");
            if (search == null) {
                search = "";
            }
        
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <a href=\"managerService.jsp\">Quan Ly Dich vu</a>\r\n");
      out.write("        <form action=\"MainController\">\r\n");
      out.write("            <input type=\"submit\" name=\"action\" value=\"Logout\"/>\r\n");
      out.write("        </form>\r\n");
      out.write("        <form action=\"MainController\">\r\n");
      out.write("            Search<input type=\"text\" name=\"search\" value=\"");
      out.print(search);
      out.write("\"/>\r\n");
      out.write("            <input type=\"submit\" name=\"action\" value=\"SearchService\"/>\r\n");
      out.write("        </form>\r\n");
      out.write("        ");

            List<Service> list = (List<Service>) request.getAttribute("LIST_SERVICE");
            if (list != null) {
                if (!list.isEmpty()) {
        
      out.write("\r\n");
      out.write("        <table border=\"1\">\r\n");
      out.write("            <thead>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <th>No</th>\r\n");
      out.write("                    <th>Service ID</th>\r\n");
      out.write("                    <th>Service Name</th>\r\n");
      out.write("                    <th>Create Date</th>\r\n");
      out.write("                    <th>Price</th>\r\n");
      out.write("                    <th>Update</th>\r\n");
      out.write("                    <th>Add detail</th>\r\n");
      out.write("                    <th>Delete</th>\r\n");
      out.write("                </tr>\r\n");
      out.write("            </thead>\r\n");
      out.write("            <tbody>\r\n");
      out.write("                ");

                    int count = 1;
                    for (Service s : list) {
                        int statusDetail = 0; // dont sow anything (0)
                        // show add detail with elec and water bill (1)
                        // show detail added (2)
                        ServiceDAO dao = new ServiceDAO();
                        if (dao.checkServiceHasDetail(s.getServiceId())){
                            statusDetail = 2;
                        }else{
                            statusDetail = 1;
                        }
                
      out.write("\r\n");
      out.write("            <form action=\"MainController\" method=\"POST\">\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>");
      out.print( count++);
      out.write("</td>\r\n");
      out.write("                    <td>");
      out.print( s.getServiceId());
      out.write("</td>\r\n");
      out.write("                    <td>                  \r\n");
      out.write("                        <input type=\"text\" name=\"serName\" value=\"");
      out.print(s.getServiceName());
      out.write("\"/>\r\n");
      out.write("                    </td>              \r\n");
      out.write("                     <td>\r\n");
      out.write("                        <input type=\"text\" name=\"serDate\" value=\"");
      out.print(s.getCreatedDate());
      out.write("\"/>\r\n");
      out.write("                    </td>\r\n");
      out.write("                    <td>\r\n");
      out.write("                        <input type=\"text\" name=\"serPrice\" value=\"");
      out.print(s.getPrice());
      out.write("\"/>\r\n");
      out.write("                    </td>\r\n");
      out.write("                    <td>\r\n");
      out.write("                        <input type=\"submit\" name=\"action\" value=\"UpdateService\"/>\r\n");
      out.write("                        <input type=\"hidden\" name=\"serID\" value=\"");
      out.print(s.getServiceId());
      out.write("\"/>\r\n");
      out.write("                        <input type=\"hidden\" name=\"search\" value=\"");
      out.print(search);
      out.write("\"/> \r\n");
      out.write("                    </td>\r\n");
      out.write("                    ");

                        if (statusDetail == 1) {
                    
      out.write("\r\n");
      out.write("                    <td>\r\n");
      out.write("                        <input type=\"hidden\" name=\"serID\" value=\"");
      out.print(s.getServiceId());
      out.write("\"/>\r\n");
      out.write("                        <input type=\"submit\" name=\"action\" value=\"AddDetailService\"/>\r\n");
      out.write("                    </td>\r\n");
      out.write("                    ");

                        }
                        else if (statusDetail == 2) {
                    
      out.write("\r\n");
      out.write("                    <td>\r\n");
      out.write("                        <input type=\"hidden\" name=\"serID\" value=\"");
      out.print(s.getServiceId());
      out.write("\"/>\r\n");
      out.write("                        <input type=\"submit\" name=\"action\" value=\"ViewDetailService\"/>\r\n");
      out.write("                    </td>\r\n");
      out.write("                    ");

                    } else {
                    
      out.write("\r\n");
      out.write("                    <td>No detail\r\n");
      out.write("                    </td>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("                    <td>\r\n");
      out.write("                        <input type=\"submit\" name=\"action\" value=\"RemoveService\"/>\r\n");
      out.write("                        <input type=\"hidden\" name=\"serID\" value=\"");
      out.print(s.getServiceId());
      out.write("\"/>\r\n");
      out.write("                        <input type=\"hidden\" name=\"search\" value=\"");
      out.print(search);
      out.write("\"/> \r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("            </form>\r\n");
      out.write("            ");

                }
            
      out.write(" \r\n");
      out.write("        </tbody>\r\n");
      out.write("    </table>\r\n");
      out.write("    ");

            }
        }

    
      out.write(" \r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("        <form action=\"MainController\">\r\n");
      out.write("            <input type=\"submit\" name=\"action\" value=\"ViewTrouble\"/>\r\n");
      out.write("        </form>\r\n");
      out.write("        <a href=\"MainController?action=befResidentRequest\" >Resident Request</a>\r\n");
      out.write("    </body>\r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
