package controller;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;


//action �뿭�븷
public interface ItemCommandInter {
	String showData(HttpServletRequest request, HttpServletResponse response) throws Exception;
}



