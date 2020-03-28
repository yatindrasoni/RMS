package com.dhavisoft.rms.ctl;


import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dhavisoft.rms.dto.AssignProgramsDTO;
import com.dhavisoft.rms.dto.CandidateDTO;

import com.dhavisoft.rms.form.CandidateForm;
import com.dhavisoft.rms.service.AssignProgramsServiceInt;
import com.dhavisoft.rms.service.CandidateServiceInt;
import com.dhavisoft.rms.validator.CandidateValidator;


/**
 * Contains navigation logics for Candidate and Candidate List UseCases.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */
@Controller
@RequestMapping(value = "/ctl/Candidate")
public class CandidateCtl extends BaseCtl {
	/**
	 * Logger object
	 */
	private static Logger log = Logger.getLogger(CandidateCtl.class);
	@Autowired
	CandidateServiceInt service;

	@Autowired
	AssignProgramsServiceInt service1;
	
	@Autowired
	CandidateValidator candidateValidator;
	
	/**
	 * i18n Message source
	 */
	@Autowired
	private MessageSource messageSource;
	
	
	
	@RequestMapping(value = "/fetch",method = RequestMethod.GET)
	public String testMethod(@RequestParam(value = "candidatePopulate",  required = false) String fName, @RequestParam(value = "populate",  required = false) String lName, @RequestParam(value = "EmailPopulate",  required = false) String email, HttpServletRequest request){
		
		  HttpSession session = request.getSession(); 
		  session.setAttribute("firstName", fName);
		  session.setAttribute("lastName", lName);
		  session.setAttribute("email", email);
  
		  String s = (String) session.getAttribute("firstName"); 
		  String s1 =(String) session.getAttribute("lastName");
		  String s2 =(String) session.getAttribute("email");
		 
		  System.out.println("populate the first111111 Name========"+s);
		  System.out.println("populate the last2222222 Name========"+s1);
		  System.out.println("populate the email2222222 Name========"+s2);
		
	    return "redirect:/ctl/AssignPrograms";
	  }
	
	/*
	 * @RequestMapping("/displayDeleteForm") public String
	 * delete(@RequestParam("candidateId") long id, Model model) {
	 * service.delete(id); return "redirect:/ctl/Candidate/search"; }
	 */
	/**
	 * Displays Candidate View.
	 *
	 * @param id
	 * @param form
	 * @param model
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String display(@RequestParam(required = false) Long id,
			@ModelAttribute("form") CandidateForm form, Model model) {
		if (id != null && id > 0) {
			form.populate(service.findByPK(id));
			System.out.println("----------SUBMIT EDIT6-------------");
		}
		return "Candidate";
	}

	/**
	 * Submits Candidate data.
	 * 
	 * @param locale
	 * @param operation
	 * @param form
	 * @param bindingResult
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(method = RequestMethod.POST)
	public String submit(Locale locale, @RequestParam String operation,
			@ModelAttribute("form") @Valid CandidateForm form,
			BindingResult bindingResult, Model model, HttpSession session) {

		log.debug("operation " + form.getOperation());
		/** CALLING CUSTOM VALIDATION **/
		candidateValidator.validate(form, bindingResult);
		CandidateDTO dto = (CandidateDTO) form.getDto();
		
		try {
			if (OP_SAVE.equalsIgnoreCase(operation)) {

				if (bindingResult.hasErrors()) {
					return "Candidate";
				}

				if (dto.getId() > 0) {
					service.update(dto);
				} else {
					Long id = service.add(dto);
					// form.setId(id);
				}
				
				String msg = messageSource.getMessage("message.success", null, locale);
				model.addAttribute("success", msg);
			
			} else if (OP_DELETE.equalsIgnoreCase(operation)) {
				
				service.delete(form.getId());

				String msg = messageSource.getMessage("message.success", null, locale);
				model.addAttribute("success", msg);
				

				return "redirect:Candidate/search";
				
			} else if (OP_CANCEL.equalsIgnoreCase(operation)) {
				if (dto.getId() > 0) {
				
					return "redirect:Candidate/search";
				} else {
					
					return "redirect:Candidate";
				}

			}

		} catch (Exception e) {
			String msg = messageSource.getMessage("message.candidateExist", null, locale);
			model.addAttribute("error", msg);

		}

		return "Candidate";
	}

	/**
	 * Displays Candidate List view.
	 * 
	 * @param form
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String searchList(@ModelAttribute("form") CandidateForm form, Model model) {
		int i = service.search(new CandidateDTO()).size();
		int size = 0;
		if (i % 5 == 0) {

			size = i / 5;
		} else {
			size = (i / 5) + 1;
		}
		model.addAttribute("size", size);

		model.addAttribute("list", service.search(new CandidateDTO(), form.getPageNo(), form.getPageSize()));
            System.out.println("-------Candidate List contoller------------");
		return "CandidateList";
	}

	/**
	 * Submits Candidate List data.
	 * 
	 * @param locale
	 * @param form
	 * @param operation
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String searchList(Locale locale,
			@ModelAttribute("form") CandidateForm form,
			@RequestParam(required = false) Integer pageNO,
			@RequestParam(required = false) String operation, Model model)
			throws Exception {

		log.debug("in searchList method");

		// Calculate next page number
		int pageNo = form.getPageNo();
		if (pageNO != null && pageNO > 0) {
			pageNo = pageNO;

		}
		if (OP_NEXT.equals(operation)) {
			pageNo++;
		} else if (OP_PREVIOUS.equals(operation)) {
			pageNo--;
		}

		if (OP_NEW.equals(operation)) {
			return "redirect:/ctl/Candidate";
		}

		pageNo = (pageNo < 1) ? 1 : pageNo;

		form.setPageNo(pageNo);

		if (OP_DELETE.equals(operation) && form.getIds() != null) {
			
			for (long id : form.getIds()) {
				service.delete(id);
			}

			String msg = messageSource.getMessage("message.success", null, locale);
			model.addAttribute("success", msg);
			CandidateDTO dto = (CandidateDTO) form.getDto();
			// NO RECORD AND DELETE RECORD
			if (service.search(dto, pageNo, form.getPageSize()).size() == 0) {
				form.setPageNo(pageNo - 1);
				return "CandidateList";

			}

		} else if (OP_DELETE.equals(operation) && form.getIds() == null) {
			
			String msg = messageSource.getMessage("message.select", null, locale);
			model.addAttribute("error", msg);

		}

		// Get search attributes
		CandidateDTO dto = (CandidateDTO) form.getDto();

		model.addAttribute("list", service.search(dto, pageNo, form.getPageSize()));
	

		int i = service.search(dto).size();
		int size = 0;
		if (i % 5 == 0) {
			size = i / 5;
		} else {
			size = (i / 5) + 1;
		}
		if (i == 0) {
			String msg = messageSource.getMessage("error.notFound", null, locale);
			model.addAttribute("error", msg);
		}
		model.addAttribute("size", size);
		return "CandidateList";
	}

}
/*
 * session.setAttribute("firstName", dto); session.setAttribute("lastName",
 * dto);
 */
