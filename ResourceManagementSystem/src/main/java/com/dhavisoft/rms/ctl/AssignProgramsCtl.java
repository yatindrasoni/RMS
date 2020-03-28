package com.dhavisoft.rms.ctl;

import java.util.Locale;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dhavisoft.rms.dto.AssignProgramsDTO;
import com.dhavisoft.rms.dto.CandidateDTO;
import com.dhavisoft.rms.dto.CollegeDTO;
import com.dhavisoft.rms.dto.CourseDTO;
import com.dhavisoft.rms.dto.ProgramDTO;
import com.dhavisoft.rms.exception.DatabaseException;
import com.dhavisoft.rms.exception.DuplicateRecordException;
import com.dhavisoft.rms.form.AssignProgramsForm;

import com.dhavisoft.rms.service.AssignProgramsServiceInt;
import com.dhavisoft.rms.service.CandidateServiceInt;
import com.dhavisoft.rms.service.CourseServiceInt;
import com.dhavisoft.rms.service.ProgramServiceInt;
import com.dhavisoft.rms.validator.AssignProgramsValidator;

/**
 * Contains navigation logics for AssignPrograms and AssignPrograms List
 * UseCases.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */
@Controller
@RequestMapping(value = "/ctl/AssignPrograms")
public class AssignProgramsCtl extends BaseCtl {

	/**
	 * Logger object
	 */
	private static Logger log = Logger.getLogger(AssignProgramsCtl.class);

	@Autowired
	AssignProgramsServiceInt service;
	
	@Autowired
	AssignProgramsValidator assignProgramsValidator;
	
	@Autowired
	private ProgramServiceInt programService;


	/**
	 * i18n Message source
	 */
	@Autowired
	private MessageSource messageSource;
	
	@Override
	public void preload(Model model) {

		model.addAttribute("programList", programService.search(new ProgramDTO()));

	}
	
	/**
	 * Displays AssignPrograms View.
	 * 
	 * @param id
	 * @param form
	 * @param model
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String display(@RequestParam(required = false) Long id, @ModelAttribute("form") AssignProgramsForm form,
			Model model) {
		if (id != null && id > 0) {
			form.populate(service.findByPK(id));
			System.out.println("----------SUBMIT EDIT88888888888888-------------");
		}
		return "AssignPrograms";
	}

	/**
	 * Submits AssignPrograms data.
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
			@ModelAttribute("form") @Valid AssignProgramsForm form, BindingResult bindingResult, Model model,
			HttpSession session) {

		log.debug("operation " + form.getOperation());
		/** CALLING CUSTOM VALIDATION **/
		assignProgramsValidator.validate(form, bindingResult);
		AssignProgramsDTO dto = (AssignProgramsDTO) form.getDto();
		try {
			if (OP_SAVE.equalsIgnoreCase(operation)) {

				if (bindingResult.hasErrors()) {
					return "AssignPrograms";
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
				
				System.out.println("SUBMIT_OP_DELETE" + operation);
				System.out.println("DELETE THE ASSIGN PROGRAM");
				service.delete(form.getId());

				String msg = messageSource.getMessage("message.success", null, locale);
				model.addAttribute("success", msg);

				return "redirect:AssignPrograms/search";

			} else if (OP_CANCEL.equalsIgnoreCase(operation)) {
				if (dto.getId() > 0) {
					return "redirect:/ctl/Candidate/search";
				} else {
					return "redirect:/ctl/Candidate/search";
				}

			}

		} catch (DuplicateRecordException e) {
			String msg = messageSource.getMessage("message.programExist1", null, locale);
			model.addAttribute("error", msg);

		} catch (DatabaseException e) {
			String msg = messageSource.getMessage("message.dateExist", null, locale);
			model.addAttribute("error", msg);

		}

		return "AssignPrograms";
	}

	/**
	 * Displays AssignPrograms List view.
	 * 
	 * @param form
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String searchList(@ModelAttribute("form") AssignProgramsForm form, Model model) {
		int i = service.search(new AssignProgramsDTO()).size();
		int size = 0;
		if (i % 5 == 0) {

			size = i / 5;
		} else {
			size = (i / 5) + 1;
		}
		model.addAttribute("size", size);

		model.addAttribute("list", service.search(new AssignProgramsDTO(), form.getPageNo(), form.getPageSize()));
		return "AssignProgramsList";
	}

	/**
	 * Submits AssignPrograms List data.
	 * 
	 * @param locale
	 * @param form
	 * @param operation
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String searchList(Locale locale, @ModelAttribute("form") AssignProgramsForm form,
			@RequestParam(required = false) Integer pageNO, @RequestParam(required = false) String operation,
			Model model) throws Exception {

		log.debug("in searchList method");

		// Calculate next page number
		int pageNo = form.getPageNo();
		if (pageNO != null && pageNO > 0) {
			pageNo = pageNO;
		}
		
		if (OP_SEARCH.equalsIgnoreCase(operation)
				|| "Next".equalsIgnoreCase(operation)
				|| "Previous".equalsIgnoreCase(operation)) {

			if (OP_SEARCH.equalsIgnoreCase(operation)) {
				pageNo = 1;
			} else if (OP_NEXT.equalsIgnoreCase(operation)) {
				pageNo++;
			} else if (OP_PREVIOUS.equalsIgnoreCase(operation) && pageNo > 1) {
				pageNo--;
			}

		}

		if (OP_NEW.equals(operation)) {
			return "redirect:/ctl/AssignPrograms";
		}
		pageNo = (pageNo < 1) ? 1 : pageNo;
		form.setPageNo(pageNo);
		if (OP_DELETE.equals(operation) && form.getIds() != null) {
			System.out.println("SEARCH_OP_DELETE" + operation);
			
			for (long id : form.getIds()) {
				service.delete(id);
			}
			
			String msg = messageSource.getMessage("message.success", null, locale);
			model.addAttribute("success", msg);
			
			AssignProgramsDTO dto = (AssignProgramsDTO) form.getDto();
			// NO RECORD AND DELETE RECORD
			
			if (service.search(dto, pageNo, form.getPageSize()).size() == 0) {
				form.setPageNo(pageNo - 1);
				return "AssignProgramsList";
			}
		} else if (OP_DELETE.equals(operation) && form.getIds() == null) {
			System.out.println("SEARCH_NULL_OP_DELETE" + operation);
			String msg = messageSource.getMessage("message.select", null, locale);
			model.addAttribute("error", msg);
		}
		// Get search attributes
		AssignProgramsDTO dto = (AssignProgramsDTO) form.getDto();
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
		return "AssignProgramsList";
	}
}
