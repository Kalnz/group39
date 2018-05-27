package com.chat.bot.test;

import chat.bot.BotController;
import static org.junit.Assert.*;
import static org.mockito.Mockito.*;
import java.io.*;
import javax.servlet.http.*;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

public class BotControllerTest extends Mockito{
    
    BotController botController;
    
   @Before
   public void setUp(){
       botController= new BotController();
       botController.init();
   }
    
    
    @Test
    public void testServlet() throws Exception {
        HttpServletRequest request = mock(HttpServletRequest.class);       
        HttpServletResponse response = mock(HttpServletResponse.class);    
        
        when(request.getParameter("ques")).thenReturn("WHAT IS JAVA");

        StringWriter stringWriter = new StringWriter();
        PrintWriter writer = new PrintWriter(stringWriter);
        when(response.getWriter()).thenReturn(writer);

       botController.doPost(request, response);
        writer.flush(); // it may not have been flushed yet...
        assertTrue(stringWriter.toString()!=null);
         System.out.println("Response "+stringWriter.toString());
    }
}
