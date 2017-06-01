
import junit.framework.TestCase;
import org.junit.Test;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by WangGenshen on 11/28/16.
 */
public class ProductParserTest extends TestCase {

    @Override
    protected void setUp() throws Exception {

    }

    @Test
    public void testAge(){
        String date = new SimpleDateFormat("yyyy").format(new Date());
        System.out.print(date);
    }
}
