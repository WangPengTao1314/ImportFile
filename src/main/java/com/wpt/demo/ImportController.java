package com.wpt.demo;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
/**
 * 文件导入导出
 * @author WangPengTao
 *
 */
@RequestMapping("/import")
@Controller
public class ImportController {

 

	@RequestMapping(value="/demo",method=RequestMethod.GET)
	public String strName() {
		System.out.println("测试成功！！！");
		return "importFile";
	}

	 
	/**
	 * 后台向前台传参的第一种方法：Model
	 * @param model
	 * @return
	 */
	/* @RequestMapping("testDemo")
	public String   demoModel(Model model) {
		System.out.println(this.getClass());
		model.addAttribute("userName","王朋涛");
		User u=new User("Will",26,"you are KU!!!");
		model.addAttribute(u);
		 *//**
		 * 返回跳转的页面
		 *//* 
		return "test";
	} */
	/**
	 * 第二种传参
	 * @return
	 */
	/* @RequestMapping("testDemo")
	public ModelAndView  modelAndView() {
		ModelAndView mv=new ModelAndView();
		mv.addObject("userName","Will");
		 *//**
		 * 跳转页面你路径
		 *//* 
		mv.setViewName("/web/test.jsp");	
		return mv;
	} */
	/**
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * @throws IOException
	 */
	/* @RequestMapping("testDemo")
	public void httpP(HttpServletRequest request,HttpServletResponse response) {
		try {
			
			request.setAttribute("userName","Will");
			 *//**
			 * 重定向
			 *//* 
			request.getRequestDispatcher("/web/test.jsp").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	} 
	 */
	

	 

}
