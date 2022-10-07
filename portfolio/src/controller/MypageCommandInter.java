package controller;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;


//action 역할
public interface MypageCommandInter {
	String showData(HttpServletRequest request, HttpServletResponse response) throws Exception;
}



