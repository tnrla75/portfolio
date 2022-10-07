package controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;


import model.FlightEndModel;
import vo.Travelatt;



public class Flightend_Impl implements CommandInter{

	static Flightend_Impl impl = new Flightend_Impl();

	public static Flightend_Impl instance(){
		return impl;
	}

//	액션의 용도, DB로 연결하는 service로 감
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("액션 진입");
		FlightEndModel model = FlightEndModel.instance();
		ArrayList<Travelatt> list = (ArrayList<Travelatt>) model.flightend_att();
		request.setAttribute("data", list); 
		System.out.println("리스트 액션");
		return "flight_end.jsp";
	}
}