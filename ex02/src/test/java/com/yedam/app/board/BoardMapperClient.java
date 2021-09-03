package com.yedam.app.board;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.app.board.domain.BoardVO;
import com.yedam.app.board.service.BoardService;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class BoardMapperClient {
	
	@Autowired BoardService boardMapper;
	
	//@Test
	public void getList() {
		log.info(boardMapper.getList().toString());
	}
	
	@Test
	public void insert() {
		//BoardVO 생성
		BoardVO vo = new BoardVO();
		vo.setTitle("이게 진짜 2페이지에 보이는거야?");
		vo.setContent("이게 진짜 2페이지에 보이는거야?");
		vo.setWriter("cherryPie");
		
		int result = boardMapper.insert(vo);
		assertEquals(result, 1);
		
		log.info(Long.toString(vo.getBno()));
	}
	
	//@Test
	public void read() {
		BoardVO vo = new BoardVO();
		vo.setBno(10);
		vo = boardMapper.read(vo);
		log.info(vo.toString());
	}
	
	//@Test
	public void update() {
		BoardVO vo = new BoardVO();
		vo.setBno(2);
		vo.setTitle("이게 진짜 새로 수정된 제목이야?");
		vo.setContent("이게 진짜 새로 수정된 내용이야?");
		vo.setWriter("cherryPie 수정");
		
		int result = boardMapper.update(vo);
		assertEquals(result, 1);
	}
	
	//@Test
	public void delete() {
		BoardVO vo = new BoardVO();
		vo.setBno(14);
		int result = boardMapper.delete(vo);
		assertEquals(result, 1);
	}

}
