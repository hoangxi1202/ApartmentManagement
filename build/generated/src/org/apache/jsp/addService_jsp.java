package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.jasper.tagplugins.jstl.core.ForEach;
import java.util.List;
import entity.ServiceTypes;
import dao.ServiceDAO;

public final class addService_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Add service Page</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    ");

        ServiceDAO dao = new ServiceDAO();
        List<ServiceTypes> listType = dao.getListServiceType();
    
      out.write("\r\n");
      out.write("    <body>\r\n");
      out.write("        <form action=\"MainController\" method=\"POST\">\r\n");
      out.write("            Service ID\r\n");
      out.write("            <input type=\"text\" name=\"serID\" required=\"\"><br>\r\n");
      out.write("            Service Name<input type=\"text\" name=\"serName\" required=\"\"><br>\r\n");
      out.write("            Create Date<input type=\"date\" name=\"serDate\" required=\"\"><br>\r\n");
      out.write("            Price<input type=\"text\" name=\"serPrice\" required=\"\"><br>\r\n");
      out.write("            Type<select name=\"type\">\r\n");
      out.write("                ");

                    for (ServiceTypes st : listType) {
                
      out.write("\r\n");
      out.write("                <option value=\"");
      out.print(st.getTypeId());
      out.write('"');
      out.write('>');
      out.print(st.getTypeName());
      out.write("</option>\r\n");
      out.write("                ");

                    }
                
      out.write("\r\n");
      out.write("            </select><br>\r\n");
      out.write("            <input type=\"submit\" name=\"action\" value=\"AddService\" >           \r\n");
      out.write("        </form>\r\n");
      out.write("        ");

            String error_message = (String) request.getAttribute("ERROR_MESSAGE");
            if (error_message == null) {
                error_message = "";
            }
        
      out.write("\r\n");
      out.write("        <h1 >");
      out.print( error_message);
      out.write("</h1>\r\n");
      out.write("    </body>\r\n");
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
