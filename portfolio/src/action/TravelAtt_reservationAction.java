package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandInter;
import svc.TravelAtt_reservationService;
import vo.Travelatt_reservation;

public class TravelAtt_reservationAction implements CommandInter{

	static TravelAtt_reservationAction impl = new TravelAtt_reservationAction();

	public static TravelAtt_reservationAction instance(){
		return impl;
	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Travelatt_reservation trvaelatt_reservation= null;
		trvaelatt_reservation = new Travelatt_reservation();
		trvaelatt_reservation.setAtt_num(Integer.parseInt(request.getParameter("attnum")));
		trvaelatt_reservation.setAtt_adult_num(Integer.parseInt(request.getParameter("adult")));
		trvaelatt_reservation.setAtt_student_num(Integer.parseInt(request.getParameter("student")));
		trvaelatt_reservation.setMb_id((request.getParameter("id")));
		TravelAtt_reservationService insert = TravelAtt_reservationService.instance();
		insert.insertRES(trvaelatt_reservation);
		return "reservationComplete.travel";
	}
}