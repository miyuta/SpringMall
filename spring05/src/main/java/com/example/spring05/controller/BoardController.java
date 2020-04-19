package com.example.spring05.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.spring05.model.BoardVO;
import com.example.spring05.model.PageMaker;
import com.example.spring05.model.PaginationVO;
import com.example.spring05.model.SearchVO;
import com.example.spring05.service.BoardService;

@Controller
@RequestMapping(value="/board/*")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService boardService;
	
	@ResponseBody
	@RequestMapping(value="/passChk", method=RequestMethod.POST)
	public  boolean passChk(@RequestBody BoardVO passChk) throws Exception {
		logger.info("post board passchk");
		
		boolean result=false;
		
		String passwd = boardService.passChk(passChk.getBno());
		if (passChk.getPasswd().equals(passwd)) {
			result=true;
		} 
		return result;
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void boardList(Model model) throws Exception {
		logger.info("get board list");
		
		model.addAttribute("boardList", boardService.boardList());
	}
	
	@RequestMapping(value="/listPage", method=RequestMethod.GET)
	public void boardListPage(Model model, PaginationVO pageVO) throws Exception {
		logger.info("get board listPage");
		
		model.addAttribute("boardListPage", boardService.boardListPage(pageVO));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPageVO(pageVO);
		pageMaker.setTotalPost(boardService.countAll());
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/listPageSch", method=RequestMethod.GET)
	public void boardListPageSch(@ModelAttribute("schVO") SearchVO schVO, Model model) throws Exception {
		logger.info("get board listPageSch");
		
		model.addAttribute("boardListPageSch", boardService.boardListPageSch(schVO));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPageVO(schVO);
		pageMaker.setTotalPost(boardService.countSch(schVO));
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void boardWrite() throws Exception {
		logger.info("get board write");
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String boardWrite(BoardVO wrtVO, MultipartHttpServletRequest mpRequest) throws Exception {
		logger.info("post board write");
		
		boardService.boardWrite(wrtVO, mpRequest);
		return "redirect:/board/listPageSch";
	}
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public void boatrdView(@RequestParam("bno") int bno, @ModelAttribute("schVO") SearchVO schVO, Model model) throws Exception {
		logger.info("get board view");
		
		model.addAttribute("boardView", boardService.boardView(bno));
		model.addAttribute("schVO", schVO);
		
		List<Map<String, Object>> fileList = boardService.fileList(bno);
		model.addAttribute("fileList", fileList);
	}
	
	@RequestMapping(value="/fileDownload", method=RequestMethod.POST)
	public void fileDownload(@RequestParam("fno") int fno, HttpServletResponse res) throws Exception {
		logger.info("post file download");
		
		Map<String, Object> resultMap = boardService.fileDownload(fno);
		String sername = (String)resultMap.get("SERNAME");
		String oriname = (String)resultMap.get("ORINAME");

		byte fileByte[] = FileUtils.readFileToByteArray(new File("F:\\JavA\\fileTest\\"+sername));
		 
		res.setContentType("application/octet-stream");
		res.setContentLength(fileByte.length);
		res.setHeader("Content-Disposition", "attachment; fileName=\""+URLEncoder.encode(oriname, "UTF-8") + "\";");
		res.getOutputStream().write(fileByte);
		res.getOutputStream().flush();
		res.getOutputStream().close();
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void boardModify(@RequestParam("bno") int bno, @ModelAttribute("schVO") SearchVO schVO, Model model) throws Exception {
		logger.info("get board modify");
		
		model.addAttribute("boardModify", boardService.boardView(bno));
		model.addAttribute("schVO", schVO);
		
		List<Map<String, Object>> fileList = boardService.fileList(bno);
		model.addAttribute("fileList", fileList);
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String boardModify(BoardVO modVO, @ModelAttribute("schVO") SearchVO schVO, RedirectAttributes rttr,
													@RequestParam(value="fileNoDel[]") String[] files, MultipartHttpServletRequest mpRequest) throws Exception {
		logger.info("post board modify");
		
		boardService.boardModify(modVO, files, mpRequest);
		rttr.addAttribute("bno", modVO.getBno());
		rttr.addAttribute("atPage", schVO.getAtPage());
		rttr.addAttribute("perPagePost", schVO.getPerPagePost());
		rttr.addAttribute("option", schVO.getOption());
		rttr.addAttribute("keyword", schVO.getKeyword());
		
		return "redirect:/board/view";
	}
	
	@ResponseBody
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public void boardDelete(@RequestBody int bno) throws Exception {
		logger.info("post board delete");
		
		boardService.boardDelete(bno);
	}
}
