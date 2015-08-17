

public class RegistrarManejador{


	  
	public RegistrarManejador(){  
	
	  HandlerRegistry registry = locator.getHandlerRegistry();
      QName serviceName = new QName("http://urldestino", "Clase Stub Cliente");

      List handlerChain = new ArrayList();
      HandlerInfo handlerInfo = new HandlerInfo(MyHandler.class, null, null);
      handlerChain.add(handlerInfo);
      registry.setHandlerChain(serviceName, handlerChain);
	  
	  }

}