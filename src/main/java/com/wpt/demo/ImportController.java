package com.wpt.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
/*
 * author:wangpengtao
 * time: 20190305
 * purpose: 文件的导入导出
 */
@Controller
public class ImportController {

	// private static final Logger LOGGER =
	// Logger.getLogger(ImportController.class);

	@RequestMapping("/demo.do")
	public String strName() {
		System.out.println("测试成功！！！");
		return "importFile";
	}

	@ResponseBody
	@RequestMapping(value = "/register.do",method=RequestMethod.POST)
	public String excelFileImport() {
		try {
			// 得到上传的文件

			 

			return "OK!!!";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}
	
	

	 

}
