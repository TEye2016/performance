package chzu.performance.controller;

import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import chzu.performance.entity.exp.AnnounceExp;
import chzu.performance.util.DateUtil;

/**
 * 任务相关
 * 
 * @author ruihui.li
 * 
 */
@Controller
@RequestMapping("/announce")
public class AnnounceController {
	@RequestMapping("/toadd")
	public String toAdd() {
		return "announce/add";
	}

	@RequestMapping("/save")
	public ModelAndView save(AnnounceExp announceExp,MultipartFile appendixfile,String beginDate,String endDate) throws ParseException {
		announceExp.setaDate(DateUtil.stringToDate(beginDate));
		announceExp.setaEnd(DateUtil.stringToDate(endDate));
		
		ModelAndView modelAndView = new ModelAndView("announce/add");
		return modelAndView;
	}
}
