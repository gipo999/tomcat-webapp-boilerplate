package com.smi.xxx.rest.base;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import org.glassfish.jersey.media.multipart.FormDataParam;

@Path("/base")
public class BaseService {

  @POST
  @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
  @Produces({MediaType.TEXT_PLAIN, MediaType.APPLICATION_JSON})
  @Path("/login")
  public Response login(
      @FormParam("username") String username, @FormParam("password") String password) {
    return Response.ok("Bearer " + username + "__" + password).build();
  } // login

  @POST
  @Consumes(MediaType.MULTIPART_FORM_DATA)
  @Produces({MediaType.TEXT_PLAIN, MediaType.APPLICATION_JSON})
  @Path("/login")
  public Response loginFormData(
      @FormDataParam("username") String username, @FormDataParam("password") String password) {
    return Response.ok("Bearer " + username + "__" + password).build();
  } // login

  @POST
  @Consumes(MediaType.APPLICATION_JSON)
  @Produces({MediaType.TEXT_PLAIN, MediaType.APPLICATION_JSON})
  @Path("/login")
  public Response loginByModel(LoginModel datas) {
    return Response.ok("Bearer " + datas.username + "__" + datas.password).build();
  } // loginByModel

  @POST
  @Path("/health")
  public Response health() {
    return Response.ok().build();
  } // health
} // LoginService
