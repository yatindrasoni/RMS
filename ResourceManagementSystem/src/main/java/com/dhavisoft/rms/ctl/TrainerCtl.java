package com.dhavisoft.rms.ctl;

import java.util.Locale;

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


import com.dhavisoft.rms.dto.ProgramDTO;
import com.dhavisoft.rms.dto.TrainerDTO;
import com.dhavisoft.rms.exception.DuplicateRecordException;

import com.dhavisoft.rms.form.TrainerForm;

import com.dhavisoft.rms.service.ProgramServiceInt;
import com.dhavisoft.rms.service.TrainerServiceInt;

import com.dhavisoft.rms.validator.TrainerValidator;

/**
 * Contains navigation logics for Trainer and Trainer List UseCases.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */

@Controller
@RequestMapping(value = "/ctl/Trainer")
public class TrainerCtl extends BaseCtl{

	/**
	 * Logger object
	 */
	private static Logger log = Logger.getLogger(TrainerCtl.class);

	@Autowired
	TrainerServiceInt service;


	@Autowired
	ProgramServiceInt programService;

	@Autowired
	TrainerValidator trainerValidator;

	/**
	 * i18n Message source
	 */
	@Autowired
	private MessageSource messageSource;

	/**
	 * Preload Program List
	 */
	@Override
	public void preload(Model model) {
		model.addAttribute("programList", programService.search(new ProgramDTO()));
	}

	/**
	 * Displays Trainer View.
	 * 
	 * @param id
	 * @param form
	 * @param model
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String display(@RequestParam(required = false) Long id, @ModelAttribute("form") TrainerForm form, Model model) {
		
		if (id != null && id > 0) {
			form.populate(service.findByPK(id));
		}
		return "Trainer";
	}

	/**
	 * Submits Trainer data.
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
	public String submit(Locale locale, @RequestParam String operation, @ModelAttribute("form") @Valid TrainerForm form,
			BindingResult bindingResult, Model model) {

		log.debug("operation " + form.getOperation());

		/** CALLING CUSTOM VALIDATION **/
		trainerValidator.validate(form, bindingResult);
		TrainerDTO dto = (TrainerDTO) form.getDto();

		try {

			if (OP_SAVE.equalsIgnoreCase(operation)) {

				if (bindingResult.hasErrors()) {
					System.out.println("------------------Trainer addddddddddddd-----------------"); 
					return "Trainer";
				}

				if (dto.getId() > 0) {

					service.update(dto);

				} else {
					System.out.println(dto.getEmail());
					Long id = service.add(dto);

					// form.setId(id);
				}
				String msg = messageSource.getMessage("message.success", null, locale);
				model.addAttribute("success", msg);
			} else if (OP_DELETE.equalsIgnoreCase(operation)) {
				service.delete(form.getId());

				String msg = messageSource.getMessage("message.success", null, locale);
				model.addAttribute("success", msg);

				return "redirect:Trainer/search";
			} else if (OP_CANCEL.equalsIgnoreCase(operation)) {
				
				if (dto.getId() > 0) {
					return "redirect:Trainer/search";
				} else {
					return "redirect:Trainer";
				}

			}
		} catch (DuplicateRecordException e) {
			String msg = messageSource.getMessage("trainer.exists", null, locale);
			model.addAttribute("error", msg);

		}

		return "Trainer";
	}

	/**
	 * Displays Trainer List view.
	 * 
	 * @param form
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String searchList(@ModelAttribute("form") TrainerForm form, Model model) {
		int i = service.search(new TrainerDTO()).size();
		int size = 0;
		if (i % 5 == 0) {

			size = i / 5;
		} else {
			size = (i / 5) + 1;
		}
		model.addAttribute("size", size);

		model.addAttribute("list", service.search(new TrainerDTO(), form.getPageNo(),
						form.getPageSize()));
		return "TrainerList";
	}

	/**
	 * Submits Trainer List data.
	 * 
	 * @param locale
	 * @param form
	 * @param operation
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String searchList(Locale locale, @ModelAttribute("form") TrainerForm form,
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
			return "redirect:/ctl/Trainer";
		}

		pageNo = (pageNo < 1) ? 1 : pageNo;

		form.setPageNo(pageNo);

		if (OP_DELETE.equals(operation) && form.getIds() != null) {
			for (long id : form.getIds()) {
				service.delete(id);
			}

			String msg = messageSource.getMessage("message.success", null, locale);
			model.addAttribute("success", msg);
			TrainerDTO dto = (TrainerDTO) form.getDto();
			// NO RECORD AND DELETE RECORD
			if (service.search(dto, pageNo, form.getPageSize()).size() == 0) {

				form.setPageNo(pageNo - 1);
				return "TrainerList";

			}

		} else if (OP_DELETE.equals(operation) && form.getIds() == null) {
			String msg = messageSource.getMessage("message.select", null, locale);
			model.addAttribute("error", msg);

		}

		// Get search attributes
		TrainerDTO dto = (TrainerDTO) form.getDto();

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
		return "TrainerList";
	}

}
