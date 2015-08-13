public class Utilidades
{

  /**
	Cargar fichero a classpath
  */
  public static final void addSoftwareLibrary()
    throws Exception
  {
    Context inicial = new InitialContext();
    Context miCtx = (Context)inicial.lookup("java:comp/env");
    String path = (String)miCtx.lookup("PATH"); //Propiedad de web.xml

    File file = new File(path + "/directorioPadre/");

    Method method = URLClassLoader.class.getDeclaredMethod("addURL", new Class[] { URL.class });
    method.setAccessible(true);
    method.invoke(ClassLoader.getSystemClassLoader(), new Object[] { file.toURI().toURL() });
  }
}