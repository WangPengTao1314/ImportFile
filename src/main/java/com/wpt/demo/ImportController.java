package com.wpt.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
/*
 * author:wangpengtao
 * time: 20190305
 * purpose: �ļ��ĵ��뵼��
 */
@Controller
public class ImportController {

	// private static final Logger LOGGER =
	// Logger.getLogger(ImportController.class);

	@RequestMapping("/demo.do")
	public String strName() {
		System.out.println("���Գɹ�������");
		return "importFile";
	}

	@ResponseBody
	@RequestMapping(value = "/register.do",method=RequestMethod.POST)
	public String excelFileImport() {
		try {
			// �õ��ϴ����ļ�

			 

			return "OK!!!";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}
	
	

	 

}
