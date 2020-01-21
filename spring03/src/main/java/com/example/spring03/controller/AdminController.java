package com.example.spring03.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.spring03.domain.CategoryVO;
import com.example.spring03.domain.GoodsVO;
import com.example.spring03.domain.GoodsViewVO;
import com.example.spring03.service.AdminService;
import com.example.spring03.utils.UploadFileUtils;
import com.google.gson.JsonObject;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

		private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
		
		@Inject
		private AdminService adminService;
		
		@Resource(name="uploadPath")
		private String uploadPath;
		
		//관리자 화면
		@RequestMapping(value="/index", method = RequestMethod.GET)
		public void getIndex() throws Exception {
			logger.info("get Index");
		}
		
		//카테고리 설정
		@RequestMapping(value="/goods/register", method = RequestMethod.GET)
		public void getGoodsRegister(Model model) throws Exception {
			logger.info("get goods register");
			
			List<CategoryVO> category = null;
			category = adminService.category();
			model.addAttribute("category", JSONArray.fromObject(category));
		}
		
		//상품등록
		@RequestMapping(value="/goods/register", method = RequestMethod.POST)
		public String postGoodsRegister(GoodsVO gds_regVO, MultipartFile file) throws Exception {
			
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String filename = null;
			
			if (file.getOriginalFilename() !=null && file.getOriginalFilename() != "") {
				filename = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			} else {
				filename = uploadPath + File.separator + "images" + File.separator + "none.png";
			}
			
			gds_regVO.setGdsimg(File.separator + "imgUpload" + ymdPath + File.separator + filename);
			gds_regVO.setGdsthumbimg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + filename);
			
			adminService.goodsRegister(gds_regVO);
			
			return "redirect:/admin/index";
		}
		
		//상품 리스트
		@RequestMapping(value="/goods/list", method = RequestMethod.GET)
		public void getGoodsList(Model model) throws Exception {
			logger.info("get goods list");
			
			List<GoodsVO> goodsList = adminService.goodsList();
			model.addAttribute("goodsList", goodsList);
		}
		
		//상품 상세
		@RequestMapping(value="/goods/view", method = RequestMethod.GET)
		public void getGoodsView(@RequestParam("n") int gdsnum, Model model) throws Exception {
			logger.info("get goods view");
			
			GoodsViewVO goodsView = adminService.goodsView(gdsnum);
			model.addAttribute("goodsView", goodsView);
		}
		
		//상품 수정
		@RequestMapping(value="/goods/modify", method = RequestMethod.GET)
		public void getGoodsmodify(@RequestParam("n") int gdsnum, Model model) throws Exception {
			logger.info("get goods modify");
			
			GoodsViewVO goodsModify = adminService.goodsView(gdsnum);
			model.addAttribute("goodsModify", goodsModify);
			
			List<CategoryVO> category = null;
			category = adminService.category();
			model.addAttribute("category", JSONArray.fromObject(category));
		}
		
		@RequestMapping(value="/goods/modify", method = RequestMethod.POST)
		public String postGoodsModify (GoodsVO gds_modVO, MultipartFile file, HttpServletRequest req) throws Exception {
			logger.info("post goods modify");
			
			//새로운 파일이 등록되어 있는지 확인
			if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
				//기존 파일을 삭제
				new File(uploadPath + req.getParameter("gdsimg")).delete();
				new File(uploadPath + req.getParameter("gdsthumbimg")).delete();
				
				//새로 첨부한 파일을 등록
				String imgUploadPath = uploadPath + File.separator + "imgUpload";
				String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
				String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
				
				gds_modVO.setGdsimg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
				gds_modVO.setGdsthumbimg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator+ "s_" + fileName);
			} else { //새로운 파일이 등록되지 않았다면
				//기존 이미지를 그대로 사용
				gds_modVO.setGdsimg(req.getParameter("gdsimg"));
				gds_modVO.setGdsthumbimg(req.getParameter("gdsthumbimg"));
			}

			adminService.goodsModify(gds_modVO);
			
			return "redirect:/admin/index";
		}
		
		//상품 삭제
		@RequestMapping(value="/goods/delete", method = RequestMethod.POST)
		public String postGoodsDelete (@RequestParam("n") int gdsnum) throws Exception {
			logger.info("post goods delete");
			
			adminService.goodsDelete(gdsnum);
			
			return "redirect:/admin/index";
		}
		
		// ck 에디터에서 파일 업로드///////////////////////////////////////////////////////
		@RequestMapping(value = "/goods/ckUpload", method = RequestMethod.POST)
		public void postCKEditorImgUpload(HttpServletRequest req,
		          HttpServletResponse res,
		          @RequestParam MultipartFile upload) throws Exception {
		 logger.info("post CKEditor img upload");
		 
		 // 랜덤 문자 생성
		 UUID uid = UUID.randomUUID();
		 
		 OutputStream out = null;
		 PrintWriter printWriter = null;
		   
		 // 인코딩
		 res.setCharacterEncoding("utf-8");
		 res.setContentType("text/html;charset=utf-8");
		 
		 try {
		  
			  String fileName = upload.getOriginalFilename();  // 파일 이름 가져오기
			  byte[] bytes = upload.getBytes();
		  
			  // 업로드 경로
			  String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;
			  System.out.println(ckUploadPath);
		  
			  out = new FileOutputStream(new File(ckUploadPath));
			  out.write(bytes);
			  out.flush();  // out에 저장된 데이터를 전송하고 초기화
		  
			  String callback = req.getParameter("CKEditorFuncNum");
			  printWriter = res.getWriter();
			  String fileUrl ="/spring03/resources/ckUpload/" + uid + "_" + fileName;  // 작성화면
			  System.out.println(fileUrl);
		  
			  // 업로드시 메시지 출력
			  JsonObject json = new JsonObject();
			  json.addProperty("uploaded", 1);
			  json.addProperty("fileName", fileName);
			  json.addProperty("url", fileUrl);
			  json.addProperty("FuncNum", callback);
			  printWriter.println(json);
			  
			  printWriter.flush();
			  
		 } catch (IOException e) { e.printStackTrace();
		 } finally {
			 try {
				 if (out != null) { out.close(); 
				 } if (printWriter != null) { printWriter.close();
				 }
			 } catch(IOException e) { e.printStackTrace(); }
		 }
		 return; 
	}
}
