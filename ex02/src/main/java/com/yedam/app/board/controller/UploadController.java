package com.yedam.app.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yedam.app.board.domain.BoardVO;

import lombok.extern.java.Log;

@Log
@Controller
public class UploadController {

   @PostMapping("/uploadFormAction")
   public void uploadFormAction(MultipartFile[] uploadFile) throws IllegalStateException, IOException {
      for (int i = 0; i < uploadFile.length; i++) {
         MultipartFile ufile = uploadFile[i];
         if (!ufile.isEmpty() && ufile.getSize() > 0) {
            String filename = ufile.getOriginalFilename(); // 실제 올린 오리지날 파일 이름
            //String saveName = System.currentTimeMillis() + ""; // 제목 현재시간으로
            UUID uuid = UUID.randomUUID();
            File file = new File("c:/upload", uuid+filename);
            ufile.transferTo(file); // 업로드 폴더로 옮겨주는 것
         }
      }
   }


      @PostMapping("/uploadAjaxAction")
      @ResponseBody
      public boolean uploadAjaxAction(MultipartFile[] uploadFile, BoardVO vo) throws IllegalStateException, IOException {
         log.info("boardvo==="+vo);
         for(int i=0; i<uploadFile.length; i++) {
            MultipartFile ufile = uploadFile[i];
            if(!ufile.isEmpty() && ufile.getSize()>0) {
               String filename = ufile.getOriginalFilename();      //실제 올린 오리지날 파일 이름
               log.info("filename==="+filename);
               
               String saveName = System.currentTimeMillis()+"";    //제목 현재시간으로 
               File file = new File("c:/upload", saveName);
               ufile.transferTo(file);                        //업로드 폴더로 옮겨주는 것
            }
         }
         return true;
      }
}