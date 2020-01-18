package com.example.spring03.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.spring03.domain.CategoryVO;
import com.example.spring03.domain.GoodsVO;
import com.example.spring03.service.AdminService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

		private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
		
		@Inject
		private AdminService adminService;
		
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
		
		@RequestMapping(value="/goods/register", method = RequestMethod.POST)
		public String postGoodsRegister(GoodsVO vo) throws Exception {
			adminService.register(vo);
			
			return "redirect:/admin/index";
		}
		
		@RequestMapping(value="/goods/list", method = RequestMethod.GET)
		public void getGoodsList(Model model) throws Exception {
			logger.info("get goods list");
			
			List<GoodsVO> goodsList = adminService.goodsList();
			model.addAttribute("goodsList", goodsList);
		}
		
		@RequestMapping(value="/goods/view", method = RequestMethod.GET)
		public void getGoodsView(@RequestParam("n") int gdsnum, Model model) throws Exception {
			logger.info("get goods view");
			
			GoodsVO goodsView = adminService.goodsView(gdsnum);
			model.addAttribute("goodsView", goodsView);
		}
}
