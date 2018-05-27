package chat.bot;

import com.google.code.chatterbotapi.ChatterBot;
import com.google.code.chatterbotapi.ChatterBotFactory;
import com.google.code.chatterbotapi.ChatterBotSession;
import com.google.code.chatterbotapi.ChatterBotType;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.alicebot.ab.Bot;
import org.alicebot.ab.Chat;
import org.alicebot.ab.History;
import org.alicebot.ab.MagicBooleans;
import org.alicebot.ab.MagicStrings;

public class BotController extends HttpServlet {

    private static final boolean TRACE_MODE = false;
    static String botName = "super";
    Chat chatSession;
    ChatterBotSession bot2session;

    @Override
    public void init() {

        ClassLoader classLoader = getClass().getClassLoader();
        URL resource = classLoader.getResource("");

        String resourcesPath = new File(resource.getFile()).getAbsolutePath();

        MagicBooleans.trace_mode = TRACE_MODE;
        Bot bot = new Bot(botName, resourcesPath);
        chatSession = new Chat(bot);
        bot.brain.nodeStats();
         // Add ML & NLP Bot session
         ChatterBotFactory factory = new ChatterBotFactory();
         try{
         ChatterBot mlBot = factory.create(ChatterBotType.PANDORABOTS, "b0dafd24ee35a477");
          bot2session = mlBot.createSession();
         }catch (Exception ex) {
            
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    public  void doPost(HttpServletRequest request, HttpServletResponse httpResponse)
            throws ServletException, IOException {
        httpResponse.setContentType("text/html;charset=UTF-8");
        PrintWriter out = httpResponse.getWriter();
        try {
            String ques = request.getParameter("ques");

            System.out.println("Ques ----  " + ques);

            if ((ques == null) || (ques.length() < 1)) {
                ques = MagicStrings.null_input;
            }

            if (MagicBooleans.trace_mode) {
                System.out.println("STATE=" + ques + ":THAT=" + ((History) chatSession.thatHistory.get(0)).get(0) + ":TOPIC=" + chatSession.predicates.get("topic"));
            }
            String response = chatSession.multisentenceRespond(ques);
            while (response.contains("&lt;")) {
                response = response.replace("&lt;", "<");
            }
            while (response.contains("&gt;")) {
                response = response.replace("&gt;", ">");
            }
            System.out.println("Robot : " + response);
             if(response==null || response.contains("I have no answer")){
                // Pass to ML to learn and do the process
                try{
               response= bot2session.think(ques);
                }catch (Exception ex) {
                    
                }
            }
            out.println(response);

        } finally {
            out.close();
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
