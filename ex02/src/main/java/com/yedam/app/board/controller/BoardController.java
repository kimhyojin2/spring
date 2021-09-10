package com.yedam.app.board.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.app.board.domain.BoardAttachVO;
import com.yedam.app.board.domain.BoardVO;
import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.PageVO;
import com.yedam.app.board.service.BoardService;


@Controller
@RequestMapping("/board/*")
//@SessionAttributes("cri")
public class BoardController {
   
   @Autowired BoardService boardService;
   
   //전체조회
   @GetMapping("/list")      //p322 전체건수 추가
   public void list(Model model, @ModelAttribute("cri") Criteria cri) {
      System.out.println("cri=====" + cri);
      int total = boardService.getTotalCount(cri);
      model.addAttribute("list", boardService.getList(cri));
      model.addAttribute("pageMaker", new PageVO(cri, total));
   }
   
   //단건조회(수정페이지)
   @GetMapping("/get")
   public void get(Model model, BoardVO board, @ModelAttribute("cri") Criteria cri) {   //bno 파라미터 -> 커맨드 객체
      model.addAttribute("board", boardService.read(board));
   }
   
   //수정처리 post
   @PostMapping("/modify")
   public String modify(BoardVO vo
                  ,@ModelAttribute("cri") Criteria cri
                  ,RedirectAttributes rttr) {
      int result = boardService.update(vo);
      if(result == 1) {
         rttr.addFlashAttribute("result", "success");         
      } 
      //rttr.addAttribute("pageNum", cri.getPageNum());
      //rttr.addAttribute("amount", cri.getAmount());
      return "redirect:/board/list";   //파라미터 전달 X
   }
   
   //등록페이지 post
   @GetMapping("/register")
   public void registerForm() {   }
   
   //등록처리 getmapping:250바이트까지만 가넝한. 짧을 때만 postmapping
   @PostMapping("/register")
   public String register(BoardVO vo 
                  ,RedirectAttributes rttr
                  ,MultipartFile[] uploadFile) throws IllegalStateException, IOException{
      List<BoardAttachVO> list = new ArrayList<BoardAttachVO>(); 
      String path = "c:/upload";
      for(int i=0; i<uploadFile.length; i++) {
         MultipartFile ufile = uploadFile[i];
         if(!ufile.isEmpty() && ufile.getSize()>0) {
            String filename = ufile.getOriginalFilename();      //실제 올린 오리지날 파일 이름          
            UUID uuid = UUID.randomUUID();
            File file = new File("c:/upload", uuid+filename);
            ufile.transferTo(file);
            //파일정보
            BoardAttachVO attachvo = new BoardAttachVO();
            attachvo.setUuid(uuid.toString());
            attachvo.setFileName(filename);
            attachvo.setUploadPath(path);
            list.add(attachvo);
      }
   }
      vo.setAttachList(list);
      boardService.insert(vo);
      
      rttr.addFlashAttribute("result", vo.getBno());
      return "redirect:/board/list";   //파라미터 전달 X
   }
   
   //삭제처리     등록, 수정, 삭제는 똑같은 패턴
   @PostMapping("/delete")
   public String delete(BoardVO vo
                  ,@ModelAttribute("cri") Criteria cri
                  , RedirectAttributes rttr) {
      int result = boardService.delete(vo);
      if(result == 1) {
         rttr.addFlashAttribute("result", "success");         
      } 
      //rttr.addFlashAttribute("pageNum", cri.getPageNum());
      //rttr.addFlashAttribute("amount", cri.getAmount());
      return "redirect:/board/list";   //파라미터 전달 X
   }
   
   
   
}