package com.smi.xxx.rest.base;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerResponseContext;
import javax.ws.rs.container.ContainerResponseFilter;
import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;

/** CORS Filter. */
@Provider
public class CorsFilter implements Filter, ContainerResponseFilter, ExceptionMapper<Throwable> {

  @Override
  public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
      throws IOException, ServletException {

    HttpServletResponse response = (HttpServletResponse) res;

    response.setHeader("Access-Control-Allow-Origin", "*");

    response.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS, HEAD");

    response.setHeader("Access-Control-Allow-Credentials", "true");

    response.setHeader("Access-Control-Max-Age", "3600");

    response.setHeader(
        "Access-Control-Allow-Headers",
        "Access-Control-Allow-Origin, X-Access_Token, Origin, X-Requested-With, x-auth-token,"
            + " Content-Type, accept, Authorization, Access-Control-Allow-Headers, Content-Range,"
            + " Content-Disposition, Content-Description, Engaged-Auth-Token, token");

    res.setCharacterEncoding("UTF-8");

    chain.doFilter(req, res);

    res.setCharacterEncoding("UTF-8");
  } // doFilter

  @Override
  public void filter(
      ContainerRequestContext requestContext, ContainerResponseContext responseContext)
      throws IOException {

    responseContext.getHeaders().add("Access-Control-Allow-Origin", "*");

    responseContext
        .getHeaders()
        .add("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS, HEAD");

    responseContext.getHeaders().add("Access-Control-Allow-Credentials", "true");

    responseContext.getHeaders().add("Access-Control-Max-Age", "3600");

    responseContext
        .getHeaders()
        .add(
            "Access-Control-Allow-Headers",
            "Access-Control-Allow-Origin, X-Access_Token, Origin, X-Requested-With, x-auth-token,"
                + " Content-Type, accept, Authorization, Access-Control-Allow-Headers,"
                + " Content-Range, Content-Disposition, Content-Description, Engaged-Auth-Token,"
                + " token");
  } // filter

  @Override
  public Response toResponse(Throwable exception) {
    return null;
  }
} // CorsFilter
