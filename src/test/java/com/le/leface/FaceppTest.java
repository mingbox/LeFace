package com.le.leface;

import org.junit.Test;

import com.le.leface.service.FacePlusPlusService;

public class FaceppTest {
	@Test
    public void test_method_1() {
		
		FacePlusPlusService fpps = new FacePlusPlusService();
		
		fpps.test();
		fpps.cleanup();
    }
	
}
