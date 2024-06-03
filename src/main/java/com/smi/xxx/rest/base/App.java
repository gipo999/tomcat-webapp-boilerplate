package com.smi.xxx.rest.base;

import java.util.HashSet;
import java.util.Set;
import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;

/**
 * Main application class.
 *
 * @author Pavel Bucek.
 */
@ApplicationPath("/")
public class App extends Application {

  /**
   * Set of classes that are root resources.
   *
   * @return set of classes
   */
  @Override
  public Set<Class<?>> getClasses() {
    final Set<Class<?>> classes = new HashSet<>();

    // register root resource
    classes.add(BaseService.class);

    return classes;
  }
}
