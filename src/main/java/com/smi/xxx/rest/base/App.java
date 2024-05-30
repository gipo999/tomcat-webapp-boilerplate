package com.smi.xxx.rest.base;

import java.io.File;
import org.apache.catalina.Context;
import org.apache.catalina.startup.Tomcat;
import org.glassfish.jersey.server.ResourceConfig;
import org.glassfish.jersey.servlet.ServletContainer;

public class App {
  public static void main(String[] args) {

    Tomcat tomcat = new Tomcat();

    String hostname = "localhost";

    // String contextPath = "/tomcat-webapp-boilerplate";
    // String contextPath = ".";
    String contextPath = "/";

    // String appBase = ".";

    String docBase = new File("src/main/webapp").getAbsolutePath();
    System.out.println("docBase: " + docBase);

    // Context context = tomcat.addContext("", docBase.getAbsolutePath());
    Context context = tomcat.addContext(contextPath, docBase);

    tomcat.setBaseDir("temp");

    tomcat.getConnector();

    tomcat.setPort(8080);

    tomcat.setHostname(hostname);

    // tomcat.getHost().setAppBase(appBase);

    // tomcat.addWebapp("/tomcat-webapp-boilerplate", docBase);
    // tomcat.addWebapp(contextPath, docBase);

    // Class servletClass = Application.class;
    // Tomcat.addServlet(context, servletClass.getSimpleName(),
    // servletClass.getName());
    // context.addServletMappingDecoded("/tomcat-webapp-boilerplate/*",
    // servletClass.getSimpleName());
    // context.addServletMappingDecoded(contextPath, servletClass.getSimpleName());

    String servletName = "baseService";
    String urlPattern = "/app/*";

    tomcat.addServlet(
        contextPath, servletName, new ServletContainer(new ResourceConfig(BaseService.class)));
    // tomcat.addServlet(
    // contextPath, servletName, new ServletContainer(new
    // ResourceConfig(Application.class)));
    context.addServletMappingDecoded(urlPattern, servletName);

    // Register Jwt filter
    // Class filterClass = JwtFilter.class;
    // FilterDef myFilterDef = new FilterDef();
    // myFilterDef.setFilterClass(filterClass.getName());
    // myFilterDef.setFilterName(filterClass.getSimpleName());
    // context.addFilterDef(myFilterDef);
    // FilterMap myFilterMap = new FilterMap();
    // myFilterMap.setFilterName(filterClass.getSimpleName());
    // myFilterMap.addURLPattern("/tomcat-webapp-boilerplate/*");
    // context.addFilterMap(myFilterMap);

    // Register Cors filter
    // Class corsFilterClass = CorsFilter.class;
    // FilterDef corsFilterDef = new FilterDef();
    // corsFilterDef.setFilterClass(corsFilterClass.getName());
    // corsFilterDef.setFilterName(corsFilterClass.getSimpleName());
    // context.addFilterDef(corsFilterDef);
    // FilterMap corsFilterMap = new FilterMap();
    // corsFilterMap.setFilterName(corsFilterClass.getSimpleName());
    // corsFilterMap.addURLPattern("/tomcat-webapp-boilerplate/*");
    // context.addFilterMap(corsFilterMap);

    // Start Tomcat
    try {
      System.out.println("Starting tomcat...");
      tomcat.start();
      tomcat.getServer().await();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  // private ServletContainer resourceConfig() {
  // return new ServletContainer(new ResourceConfig(BaseService.class));
  // }
}

// import java.io.File;
// import java.io.IOException;
// import java.io.PrintWriter;
// import javax.servlet.ServletException;
// import javax.servlet.http.HttpServlet;
// import javax.servlet.http.HttpServletRequest;
// import javax.servlet.http.HttpServletResponse;
// import org.apache.catalina.Context;
// import org.apache.catalina.LifecycleException;
// import org.apache.catalina.startup.Tomcat;

// public class App {
//
// public static void main(String[] args) throws LifecycleException {
// Tomcat tomcat = new Tomcat();
// tomcat.setBaseDir("temp");
// tomcat.getConnector();
// tomcat.setPort(8080);
//
// String contextPath = "/";
// String docBase = new File(".").getAbsolutePath();
//
// Context context = tomcat.addContext(contextPath, docBase);
//
// HttpServlet servlet =
// new HttpServlet() {
// @Override
// protected void doGet(HttpServletRequest req, HttpServletResponse resp)
// throws ServletException, IOException {
// PrintWriter writer = resp.getWriter();
//
// writer.println("<html><title>Welcome</title><body>");
// writer.println("<h1>Have a Great Day!</h1>");
// writer.println("</body></html>");
// }
// };
//
// String servletName = "Servlet1";
// String urlPattern = "/go";
//
// tomcat.addServlet(contextPath, servletName, servlet);
// context.addServletMappingDecoded(urlPattern, servletName);
//
// tomcat.start();
// tomcat.getServer().await();
// }
// }
