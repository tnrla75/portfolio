package vo;

import java.sql.Date;

public class FlightTicketBean {
	private String flight_Ticket_Num;
	private	String flight_name;
	private String flight_departure;
	private String flight_arrival;
	private String flight_departureTime;
	private String flight_arrivalTime;
	private Date flight_departureDay;
	private int flight_Ticket_Price;
	private String estimated_time;
	
	

	public String getEstimated_time() {
		return estimated_time;
	}
	public void setEstimated_time(String estimated_time) {
		this.estimated_time = estimated_time;
	}
	public int getFlight_Ticket_Price() {
		return flight_Ticket_Price;
	}
	public void setFlight_Ticket_Price(int flight_Ticket_Price) {
		this.flight_Ticket_Price = flight_Ticket_Price;
	}
	
	public String getFlight_Ticket_Num() {
		return flight_Ticket_Num;
	}
	public void setFlight_Ticket_Num(String flight_Ticket_Num) {
		this.flight_Ticket_Num = flight_Ticket_Num;
	}
	public String getFlight_name() {
		return flight_name;
	}
	public void setFlight_name(String flight_name) {
		this.flight_name = flight_name;
	}
	public String getFlight_departure() {
		return flight_departure;
	}
	public void setFlight_departure(String flight_departure) {
		this.flight_departure = flight_departure;
	}
	public String getFlight_arrival() {
		return flight_arrival;
	}
	public void setFlight_arrival(String flight_arrival) {
		this.flight_arrival = flight_arrival;
	}
	public String getFlight_departureTime() {
		return flight_departureTime;
	}
	public void setFlight_departureTime(String flight_departureTime) {
		this.flight_departureTime = flight_departureTime;
	}
	public String getFlight_arrivalTime() {
		return flight_arrivalTime;
	}
	public void setFlight_arrivalTime(String flight_arrivalTime) {
		this.flight_arrivalTime = flight_arrivalTime;
	}
	public Date getFlight_departureDay() {
		return flight_departureDay;
	}
	public void setFlight_departureDay(Date flight_departureDay) {
		this.flight_departureDay = flight_departureDay;
	}
}
