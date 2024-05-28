package com.smi.xxx.rest.base;

import java.util.HashSet;
import java.util.Set;
import javax.ws.rs.ApplicationPath;

/**
 * @author Pavel Bucek
 */
@ApplicationPath("/")
public class Application extends javax.ws.rs.core.Application {

  @Override
  public Set<Class<?>> getClasses() {
    final Set<Class<?>> classes = new HashSet<Class<?>>();

    // register root resource
    classes.add(BaseService.class);

    return classes;
  }
}
