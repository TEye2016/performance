package chzu.performance.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sun.corba.se.impl.interceptors.PICurrent;

import chzu.performance.entity.AnnounceAppendix;
import chzu.performance.entity.User;
import chzu.performance.entity.exp.AnnounceExp;
import chzu.performance.service.AnnounceService;
import chzu.performance.util.DateUtil;
import chzu.performance.util.FileUtil;

/**
 * 任务相关
 * 
 * @author ruihui.li
 * 
 */
@Controller
@RequestMapping("/announce")
public class AnnounceController {
	@Autowired
	private AnnounceService announceService;
	@RequestMapping("/toadd")
	public String toAdd() {
		return "announce/add";
	}

	@RequestMapping("/save")
	public ModelAndView save(AnnounceExp announceExp,MultipartFile appendixfile,String beginDate,String endDate,HttpSession session) throws Exception {
		announceExp.setaDate(DateUtil.stringToDate(beginDate));
		announceExp.setaEnd(DateUtil.stringToDate(endDate));
		announceExp.setUserid(((User)session.getAttribute("userSession")).getUserid());
		announceExp.setUserName(((User)session.getAttribute("userSession")).getUserrealname());
		AnnounceAppendix announceAppendix = new AnnounceAppendix();
		announceAppendix.setName(appendixfile.getOriginalFilename());
		announceAppendix.setUrl(FileUtil.upFile(appendixfile));
		this.announceService.save(announceExp, announceAppendix);
		ModelAndView modelAndView = new ModelAndView("announce/add");
		return modelAndView;
	}
}
