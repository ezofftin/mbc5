package com.mbc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mbc.service.BoardService;
import com.mbc.jeju.domain.BoardDTO;
import com.mbc.jeju.domain.PageDTO;

@Controller
public class BoardController {

    @Autowired
    private BoardService service;

    // 게시글 등록폼 뷰  // GET
    @GetMapping("/registerBoard.do")
    public String registerBoard() {
        return "board/registerBoard";
    }

    // 게시글 등록 OK  // POST
    @PostMapping("/registerBoard.do")
    public String registerBoard(BoardDTO dto) {
        service.registerBoard(dto);
        return "redirect:boardList.do";
    }

    // 게시글 리스트 뷰  // @RequestMapping = Get, Post 둘다 지원
    @RequestMapping("/boardList.do")
    public String boardList(PageDTO pDto, Model model) {
        List<BoardDTO> boardList = service.listBoard(pDto);
        model.addAttribute("list", boardList);
        model.addAttribute("pDto", pDto); // 바인딩되는 pDto는 serviceImpl에서 셋팅된 pDto
        return "board/boardList";
    }

    // 게시글 상세보기 뷰 -> 수정 또는 삭제로 들어감
    @GetMapping("/viewBoard.do")
    public String viewBoard(int bid, PageDTO pDto, Model model) {
        BoardDTO dto = service.viewBoard(bid, "y");
        model.addAttribute("dto", dto);
        model.addAttribute("pDto", pDto);
        return "board/viewBoard";
    }

    // 게시글 수정 폼으로 이동 // GET
    @GetMapping("/modifyBoard.do")
    public String modifyBoard(int bid, PageDTO pDto, Model model) {
        BoardDTO dto = service.viewBoard(bid, "n");
        model.addAttribute("dto", dto);
        model.addAttribute("pDto", pDto);
        return "board/modifyBoard";
    }

    // 게시글 수정하기 OK // POST
    @PostMapping("/modifyBoard.do")
    public String modifyBoard(BoardDTO dto, PageDTO pDto) {
        service.modifyBoard(dto);
        return "redirect:boardList.do?viewPage=" + pDto.getViewPage()
                + "&searchType=" + pDto.getSearchType()
                + "&keyword=" + pDto.getKeyword()
                + "&cntPerPage=" + pDto.getCntPerPage();
    }

    // 게시글 삭제 // GET
    @GetMapping("/removeBoard.do")
    public String removeBoard(int bid, PageDTO pDto) {
        service.removeBoard(bid);
        return "redirect:boardList.do?viewPage=" + pDto.getViewPage()
                + "&searchType=" + pDto.getSearchType()
                + "&keyword=" + pDto.getKeyword()
                + "&cntPerPage=" + pDto.getCntPerPage();
    }

    
}
