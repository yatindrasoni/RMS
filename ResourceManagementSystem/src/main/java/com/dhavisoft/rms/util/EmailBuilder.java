package com.dhavisoft.rms.util;

import java.util.HashMap;
//import java.util.Map;

//import org.apache.regexp.recompile;

/**
 * Class that build application Email messages
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */

public class EmailBuilder {

	/**
	 * Returns Successful User Registration Message
	 * 
	 * @param map
	 *            : Message parameters
	 * @return
	 */
	public static String getUserRegistrationMessage(HashMap<String, String> map) {
		StringBuilder msg = new StringBuilder();

		msg.append("<HTML><BODY>");
		msg.append("Registration is successful for RMS Project DHAVISOFT Technologies");
		msg.append("<H1>Hi! Greetings from DHAVISOFT Technologies!</H1>");
		msg.append("<P>Congratulations for registering on RMS! You can now access your RMS account online - anywhere, anytime and enjoy the flexibility to check the Marksheet Details.</P>");
		msg.append("<P>Log in today at <a href='http://rms.dhavisoft.com'>http://rms.dhavisoft.com</a> with your following credentials:</P>");
		msg.append("<P><B>Login Id : " + map.get("login") + "<BR>"
				+ " Password : " + map.get("password") + "</B></p>");

		msg.append("<P> As a security measure, we recommended that you change your password after you first log in.</p>");
		msg.append("<p>For any assistance, please feel free to call us at +91 9893828293 helpline numbers.</p>");
		msg.append("<p>You may also write to us at shreyansh.soni.sdg@gmail.com</p>");
		msg.append("<p>We assure you the best service at all times and look forward to a warm and long-standing association with you.</p>");
		msg.append("<P><a href='http://www.dhavisoft.com' >-DHAVISOFT Technolgies</a></P>");
		msg.append("</BODY></HTML>");

		return msg.toString();
	}

	/**
	 * Returns Email message of Forget Password
	 * 
	 * @param map
	 *            : params
	 * @return
	 */
	public static String getForgetPasswordMessage(HashMap<String, String> map) {
		StringBuilder msg = new StringBuilder();

		msg.append("<HTML><BODY>");
		msg.append("<H1>Your password is recovered !! " + map.get("firstName")
				+ " " + map.get("lastName") + "</H1>");
		msg.append("<P><B>To access account your Login Id : "
				+ map.get("login") + "<BR>" + " Password : "
				+ map.get("password") + "</B></p>");
		msg.append("</BODY></HTML>");

		return msg.toString();
	}

	/**
	 * Returns Email message of Change Password
	 * 
	 * @param map
	 * @return
	 */
	public static String getChangePasswordMessage(HashMap<String, String> map) {
		StringBuilder msg = new StringBuilder();

		msg.append("<HTML><BODY>");
		msg.append("<H1>Your Password has been changed Successfully !! "
				+ map.get("firstName") + " " + map.get("lastName") + "</H1>");
		msg.append("<P><B>To access account user Login Id : "
				+ map.get("login") + "<BR>" + " Password : "
				+ map.get("password") + "</B></p>");
		msg.append("</BODY></HTML>");

		return msg.toString();
	}

}
