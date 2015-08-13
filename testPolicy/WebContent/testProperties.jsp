<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.util.Enumeration" %>
 <%@ page import="java.security.Provider" %>
 <%@ page import="java.security.Security" %>
 <%@ page import="org.bouncycastle.jce.provider.BouncyCastleProvider" %>
 
 

 

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Propiedades proveedores seguridad</title>
</head>
<body>


<script type="text/javascript" language="javascript">
<!--


			
//-->		
</script>

<h2>Propiedades proveedores seguridad</h2>


 <table style="border: 1px solid black;width: 100%;">
	 <caption>Propiedades</caption>
	 
	 
	 <tr>
	   <th style=" border: 1px solid black;">Nombre</th><th style=" border: 1px solid black;">Valor</th> 
	 </tr>
	 
	 <%
	  String clave="";
	  String valor="";
	  Provider[] providers = Security.getProviders();
	    for (int i = 0; i < providers.length; i++){
	      String name = providers[i].getName();
	      
	      if(providers[i].getName().equalsIgnoreCase(BouncyCastleProvider.PROVIDER_NAME)){
	    	  
	    	  
			    	  Enumeration enumeration=providers[i].keys();
			    	  
		 				 while(enumeration.hasMoreElements()){
			    		  
			    		  clave=enumeration.nextElement().toString();
			    		  valor=providers[i].getProperty(clave);
			    		  
			    	
			    	  
	      %>
				 <tr>
				  <td style="border: 1px solid black;"><%=clave%></td>
				  <td style="border: 1px solid black;"><%=valor%></td>
				 </tr>
				<%
		 				 }
		 				  
	      }
	      
	    }
				
				%> 
				
				

 </table>


</body>
</html>








