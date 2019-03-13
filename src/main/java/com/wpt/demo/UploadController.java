package com.wpt.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping("/upload")
@Controller
public class UploadController {
	
	@RequestMapping(value="/register.do",method=RequestMethod.GET)
	public String uploadFileGet() {
		System.out.println("GET.....");
		return "register";
		
	}
	
	
	@RequestMapping(value="/uploadFile.do")
	public String uploadFilePost(MultipartFile uploadFile ) {	
		
		System.out.println("«Î«Û≥…π¶£°£°£°");
		return "uploadFile";
		
	}

}
