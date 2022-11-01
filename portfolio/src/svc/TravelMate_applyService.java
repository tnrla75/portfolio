package svc;

import static db.TravelDButil.close;
import static db.TravelDButil.getConnection;

import java.sql.Connection;
import travel_package.MateController;

import vo.TravelMate_apply;

public class TravelMate_applyService {

	public void mateapply(TravelMate_apply travelmate_apply) throws Exception{                        
		Connection con = getConnection();
		MateController mc = new MateController();
		 mc.mateapply(travelmate_apply);
		close(con);
	}
}
