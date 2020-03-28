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

import com.dhavisoft.rms.dto.CandidateDTO;
import com.dhavisoft.rms.dto.CourseDTO;
import com.dhavisoft.rms.dto.ProgramDTO;
import com.dhavisoft.rms.dto.TimeTableDTO;
import com.dhavisoft.rms.dto.TrainerDTO;
import com.dhavisoft.rms.exception.DatabaseException;
import com.dhavisoft.rms.exception.DuplicateRecordException;
import com.dhavisoft.rms.form.TimeTableForm;
import com.dhavisoft.rms.service.CourseServiceInt;
import com.dhavisoft.rms.service.ProgramServiceInt;
import com.dhavisoft.rms.service.TimeTableServiceInt;
import com.dhavisoft.rms.service.TrainerServiceInt;
//import com.dhavisoft.rms.validator.TimeTableValidator;

/**
 * Contains navigation logics for TimeTable and TimeTable List UseCases.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */

@Controller
@RequestMapping(value = "/ctl/TimeTable")
public class TimeTableCtl extends BaseCtl{

	private static Logger log = Logger.getLogger(TimeTableCtl.class);

	@Autowired
	private TimeTableServiceInt service;

	/*
	 * @Autowired TimeTableValidator timeTableValidator;
	 */

	@Autowired
	private ProgramServiceInt programservice;
	
	@Autowired
	TrainerServiceInt trainerService;

	/**
	 * i18n Message source
	 */
	@Autowired
	private MessageSource messageSource;

	
	@Override
	public void preload(Model model) {
		
		model.addAttribute("programList", programservice.search(new ProgramDTO()));
		model.addAttribute("trainerList", trainerService.search(new TrainerDTO()));
		
	}

	/******************************* DISPLAY LOGIC(GET) ************************************/
	/**
	 * Displays TimeTable view.
	 * 
	 * @param id
	 * @param form
	 * @param model
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String display(@RequestParam(required = false) Long id,
			@ModelAttribute("form") TimeTableForm form, Model model) {

		log.debug("TimeTableCtl doDisplay() Start");

		if (id != null && id > 0) {
			form.populate(service.findByPK(id));
		}
		return "TimeTable";
	}

	/******************************* SUBMIT LOGIC(POST) ************************************/
	/**
	 * Submits TimeTable data.
	 * 
	 * @param locale
	 * @param operation
	 * @param form
	 * @param bindingResult
	 * @param model
	 * @return
	 */

	@RequestMapping(method = RequestMethod.POST)
	public String submit(Locale locale, @RequestParam String operation,
			@ModelAttribute("form") @Valid TimeTableForm form,
			BindingResult bindingResult, Model model) {

		log.debug("TimeTableCtl doSubmit Start ");
		/** CALLING CUSTOM VALIDATION **/
		//timeTableValidator.validate(form, bindingResult);
		
		TimeTableDTO dto = (TimeTableDTO) form.getDto();

		try {
			if (OP_SAVE.equalsIgnoreCase(operation)) {

				if (bindingResult.hasErrors()) {
					return "TimeTable";
				}

				if (dto.getId() > 0) {
					service.update(dto);
				} else {
					long id = service.add(dto);
					// form.setId(id);
				}
				String msg = messageSource.getMessage("message.success", null, locale);
				
				model.addAttribute("success", msg);

			} else if (OP_DELETE.equalsIgnoreCase(operation)) {
				service.delete(form.getId());
			
				String msg = messageSource.getMessage("message.success", null,locale);
				model.addAttribute("success", msg);
				
				return "redirect:TimeTable/search";
				
			} else if (OP_CANCEL.equalsIgnoreCase(operation)) {
				TimeTableDTO dto1 = (TimeTableDTO) form.getDto();
				if (dto1.getId() > 0) {

					return "redirect:TimeTable/search";
				} else {
					return "redirect:TimeTable";
				}
			}

		} catch (DuplicateRecordException e) {

			String msg = messageSource.getMessage("message.examExist", null, locale);
			model.addAttribute("error", msg);

			/*
			 * model.addAttribute("error",
			 * "Exam is already been scheduled for this subject in this course"
			 * );
			 */

		} catch (DatabaseException e) {
			String msg = messageSource.getMessage("message.dateExist", null, locale);
			model.addAttribute("error", msg);

			/*
			 * model.addAttribute("error",
			 * "This date is already been occupied for this course");
			 */
		}

		return "TimeTable";
	}

	/******************************* TIME TABLE LIST VIEW(GET) ************************************/
	/**
	 * Displays TimeTable List view.
	 * 
	 * @param form
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String searchList(@ModelAttribute("form") TimeTableForm form,
			Model model) {

		int i = service.search(new TimeTableDTO()).size();
		int size = 0;
		if (i % 5 == 0) {

			size = i / 5;
		} else {
			size = (i / 5) + 1;
		}
		model.addAttribute("size", size);

		model.addAttribute(	"list",	service.search(new TimeTableDTO(), form.getPageNo(),
						form.getPageSize()));
		return "TimeTableList";
	}

	/******************************* TIME TABLE LIST VIEW(POST) **********************************/
	/**
	 * Submits TimeTable List data.
	 * 
	 * @param locale
	 * @param form
	 * @param operation
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/search", method = { RequestMethod.POST })
	public String searchList(Locale locale,
			@ModelAttribute("form") TimeTableForm form,
			@RequestParam(required = false) Integer pageNO,
			@RequestParam(required = false) String operation, Model model) {

		log.debug("in searchList method");

		// Calculate next page number
		int pageNo = form.getPageNo();
		if (pageNO != null && pageNO > 0) {
			pageNo = pageNO;

		}

		/*
		 * if (OP_NEXT.equals(operation)) { pageNo++; } else if
		 * (OP_PREVIOUS.equals(operation) && pageNO > 1) { pageNo--; } else if
		 * (OP_SEARCH.equals(operation)) { pageNo = 1; }
		 */

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

			return "redirect:/ctl/TimeTable";
		}

		pageNo = (pageNo < 1) ? 1 : pageNo;

		form.setPageNo(pageNo);

		if (OP_DELETE.equals(operation) && form.getIds() != null) {
			for (long id : form.getIds()) {
				service.delete(id);
			}

			String msg = messageSource.getMessage("message.success", null,
					locale);
			model.addAttribute("success", msg);
			TimeTableDTO dto = (TimeTableDTO) form.getDto();
			// NO RECORD AND DELETE RECORD
			if (service.search(dto, pageNo, form.getPageSize()).size() == 0) {

				form.setPageNo(pageNo - 1);
				return "TimeTableList";

			}
			// SELECT RECORD
		} else if (OP_DELETE.equals(operation) && form.getIds() == null) {
			String msg = messageSource.getMessage("message.select", null,
					locale);
			model.addAttribute("error", msg);

		}

		// Get search attributes
		TimeTableDTO dto = (TimeTableDTO) form.getDto();

		model.addAttribute("list",
				service.search(dto, pageNo, form.getPageSize()));
		int i = service.search(dto).size();
		int size = 0;
		if (i % 5 == 0) {
			size = i / 5;
		} else {
			size = (i / 5) + 1;
		}
		if (i == 0) {
			String msg = messageSource.getMessage("error.notFound", null,
					locale);
			model.addAttribute("error", msg);
		}
		model.addAttribute("size", size);
		return "TimeTableList";
	}

}