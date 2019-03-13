package com.wpt.demo;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * 文件的上传下载
 * 
 * @author WangPengTao
 *
 */
@RequestMapping("/upload")
@Controller
public class UploadController {

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String uploadFileGet() {
		System.out.println("GET.....");
		return "register";

	}

	@ResponseBody
	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public String uploadFilePost(@RequestParam("uploadFile") MultipartFile uploadFile,
			@RequestParam("name") String name, HttpServletRequest req) {
		// 获取表单中参数名
		// System.out.println(uploadFile.getName());
		// 获取文件名
		// System.out.println(uploadFile.getOriginalFilename());
		// System.out.println(uploadFile.getContentType());
		// System.out.println(uploadFile.getSize());
		//try {
			// 获取文件输出流
			// System.out.println(uploadFile.getInputStream());
			// 获取文件的字节数
			// System.out.println(uploadFile.getBytes());
		//} catch (IOException e) {
		//	e.printStackTrace();
		//}
		// 判断文件是否为空
		/// System.out.println(uploadFile.isEmpty());
		try {
			// 获取当前项目路径
			String proAddress = req.getServletContext().getRealPath("/");
			System.out.println(proAddress);
			//
			File file = new File(proAddress + "webFile", uploadFile.getOriginalFilename());
			// 随机访问父目录
			File fileParent = file.getParentFile();
			if (!fileParent.exists()) {
				fileParent.mkdirs();
			}
			IOUtils.copy(uploadFile.getInputStream(), new FileOutputStream(file));
		} catch (FileNotFoundException e) {

			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "uploadFile";

	}

}
