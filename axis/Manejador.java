import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import javax.xml.namespace.QName;
import javax.xml.soap.SOAPMessage;
import org.apache.axis.AxisFault;
import org.apache.axis.MessageContext;
import org.apache.axis.handlers.BasicHandler;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class MyHandler extends BasicHandler
{
  private static final long serialVersionUID = 5216725378031896814L;
  private static Log LOG = LogFactory.getLog(MyHandler.class);

  public void init()
  {
    super.init();
    LOG.info("Manejador Axis inicializado");
  }

  public void cleanup()
  {
    super.cleanup();
    LOG.info("Clean up manejador Axis");
  }

  public void invoke(MessageContext mc) throws AxisFault
  {
    LOG.info(" --------------------- Invocación de cliente web sevice capturada con handler -------------------------------");

    SOAPMessage soapmessage = mc.getMessage();

    String xml = "";

    ByteArrayOutputStream out = new ByteArrayOutputStream();
    try {
      soapmessage.writeTo(out);
      xml = out.toString("UTF-8");
      LOG.info(xml);
      LOG.info("---------- Fin de captura de mensaje SOAP----------------");
    } catch (Exception e) {
      LOG.error(e.getMessage(), e);
    }
  }

  public QName[] getHeaders()
  {
    System.out.println("getHeaders");
    return new QName[1];
  }
}