package com.wpt.demo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
@Controller
/**
 * 
 * @author WangPengTao
 *
 */
public class ImportController {

	// private static final Logger LOGGER =
	// Logger.getLogger(ImportController.class);

	@RequestMapping(value="/demo.do",method=RequestMethod.GET)
	public String strName() {
		System.out.println("���Գɹ�������");
		return "importFile";
	}

	/*@ResponseBody
	@RequestMapping(value = "/register.do",method=RequestMethod.POST)
	public String excelFileImport() {
		try {
			// �õ��ϴ����ļ�

			 

			return "OK!!!";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}*/
	 
	/**
	 * ��̨��ǰ̨���εĵ�һ�ַ�����Model
	 * @param model
	 * @return
	 */
	/*@RequestMapping("")
	public String   demoModel(Model model) {
		System.out.println(this.getClass());
		model.addAttribute("userName","������");
		User u=new User("Will",26,"you are KU!!!");
		model.addAttribute(u);
		*//**
		 * ������ת��ҳ��
		 *//*
		return "";
	}*/
	/**
	 * �ڶ��ִ���
	 * @return
	 */
	/*@RequestMapping("")
	public ModelAndView  modelAndView() {
		ModelAndView mv=new ModelAndView();
		mv.addObject("userName","Will");
		*//**
		 * ��תҳ����·��
		 *//*
		mv.setViewName("");	
		return mv;
	}*/
	/**
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * @throws IOException
	 */
	/*@RequestMapping("")
	public void httpP(HttpServletRequest request,HttpServletResponse response) throws Exception, IOException {
		try {
			
			request.setAttribute("userName","Will");
			*//**
			 * �ض���
			 *//*
			request.getRequestDispatcher("").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}*/
	 
	

	 

}
