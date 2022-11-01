package svc;

import static db.TravelDButil.close;
import static db.TravelDButil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.TravelDAO;
import vo.Hotel_main_DTO;
import vo.Travelattandimg;
import vo.Travellocal;

public class Travel_tripguideService {
		public static ArrayList<Travellocal> tripguide_select() throws Exception{
			
			ArrayList<Travellocal> travellocal = null;
			Connection con = getConnection();
			TravelDAO travelDAO = TravelDAO.getInstance();
			travelDAO.setConnection(con);
			travellocal = travelDAO.tripguide_select();
			close(con);
			return travellocal;
		}
		
	public static ArrayList<Hotel_main_DTO> tripguide_hotel_select() throws Exception{
			
			ArrayList<Hotel_main_DTO> hotel = null;
			Connection con = getConnection();
			TravelDAO travelDAO = TravelDAO.getInstance();
			travelDAO.setConnection(con);
			hotel = travelDAO.tripguide_hotel_select();
			close(con);
			return hotel;
		}
}
