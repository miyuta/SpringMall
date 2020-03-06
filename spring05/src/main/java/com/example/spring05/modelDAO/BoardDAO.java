package com.example.spring05.modelDAO;

import com.example.spring05.modelVO.BoardVO;

public interface BoardDAO {
	public void boardWrite(BoardVO insVO) throws Exception;
}
