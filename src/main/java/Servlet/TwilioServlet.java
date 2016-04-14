/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Bean.TwilioConnect;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.factory.SmsFactory;
import com.twilio.sdk.resource.instance.Sms;
import com.twilio.sdk.resource.factory.OutgoingCallerIdFactory;
import com.twilio.sdk.resource.instance.CallerIdValidation;
import com.twilio.sdk.resource.list.OutgoingCallerIdList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author yla
 */
@WebServlet(name = "TwilioServlet", urlPatterns = {"/TwilioServlet"})
public class TwilioServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TwilioServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TwilioServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
			
    /*
		params.put("FriendlyName", "My Number");
		params.put("PhoneNumber", "+639232267709");	
		
		TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);
		OutgoingCallerIdFactory callerIdFactory = client.getAccount().getOutgoingCallerIdFactory();
		CallerIdValidation validationAttempt;
		try{
			validationAttempt = callerIdFactory.create(params);
		}
		catch (TwilioRestException e) {
            throw new ServletException(e);
		}
	*/	
			
        //processRequest(request, response);
		
		TwilioConnect connect = new TwilioConnect();
		
		final String ACCOUNT_SID = connect.getAcctSID();
		final String AUTH_TOKEN = connect.getAuthToken();	
		TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);
		
        PrintWriter out = response.getWriter();
        Sms msg = null;
        
        Map<String, String> params = new HashMap<String, String>();
        
		String[] presidents = request.getParameterValues("pres");
		String list = "";
		
		for (int i = 0; i < presidents.length; i++){
			list = list.concat(presidents + "\n");
		}
		
        params.put("From", "+12016902137");
        params.put("Body", "You have chosen to follow the following candidates: \n" + list + "\n Thank you for using MCDO campaign mobile services.");
        params.put("To", request.getParameter("twilio_num"));
        
        SmsFactory msgFactory = client.getAccount().getSmsFactory();
        try {
            msg = msgFactory.create(params);
        }
        catch (TwilioRestException e) {
            throw new ServletException(e);
	}
        out.println("Sent message id: " + msg.getSid());
		
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
