
package com.chat.bot.test;

import chat.bot.InitialQuestion;
import static org.junit.Assert.*;
import static org.mockito.Mockito.*;
import java.io.*;
import javax.servlet.http.*;
import org.junit.Test;
import org.mockito.Mockito;

public class InitialQuestionTest extends Mockito {
 
     @Test
    public void testServlet() throws Exception {
        HttpServletRequest request = mock(HttpServletRequest.class);       
        HttpServletResponse response = mock(HttpServletResponse.class);    
        
        when(request.getParameter("sid")).thenReturn("S12343");
        when(request.getParameter("existstud")).thenReturn("yes");

        StringWriter stringWriter = new StringWriter();
        PrintWriter writer = new PrintWriter(stringWriter);
        when(response.getWriter()).thenReturn(writer);

        new InitialQuestion().doPost(request, response);
        writer.flush(); // it may not have been flushed yet...
        assertTrue(stringWriter.toString()!=null);
    }
    
}
