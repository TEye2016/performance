package performance;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;

public class DateTest {
	@Test
	public void test(){
		SimpleDateFormat date = new SimpleDateFormat("yyyy-mm-dd");
		try {
			Date date2 = date.parse("2016-06-19");
			System.out.println(date2);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
