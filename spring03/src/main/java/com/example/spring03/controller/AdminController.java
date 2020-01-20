package com.example.spring03.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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
		
		@RequestMapping(value="goods/modify", method = RequestMethod.POST)
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
		@RequestMapping(value="goods/delete", method = RequestMethod.POST)
		public String postGoodsDelete (@RequestParam("n") int gdsnum) throws Exception {
			logger.info("post goods delete");
			
			adminService.goodsDelete(gdsnum);
			
			return "redirect:/admin/index";
		}
}
