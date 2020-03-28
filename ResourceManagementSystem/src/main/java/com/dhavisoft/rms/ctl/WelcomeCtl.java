package com.dhavisoft.rms.ctl;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Contains navigation logics for Welcome.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */

@Controller
@RequestMapping("/Welcome")
public class WelcomeCtl extends BaseCtl {

	@RequestMapping(method = RequestMethod.GET)
	public String display(ModelMap model) {
		return "Welcome";
	}

}
