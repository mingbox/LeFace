package com.le.leface;

import java.awt.image.BufferedImage;
import java.awt.image.DataBufferByte;
import java.awt.image.WritableRaster;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.junit.Test;

import com.le.leface.service.impl.FaceDetectServiceFacePPImpl;


public class FaceppTest {
	private static final String IMG_PATH = "/Users/mingboxu/tmp.jpg";
	
	FaceDetectServiceFacePPImpl fds = new FaceDetectServiceFacePPImpl();
	
	@Test
    public void test_method_1() throws IOException {
		File imgPath = new File(IMG_PATH);
		BufferedImage bufferedImage = ImageIO.read(imgPath);
		WritableRaster raster = bufferedImage.getRaster();
		DataBufferByte binaryImage = (DataBufferByte) raster.getDataBuffer();
		
		//fds.detect("test", binaryImage.getData());
    }
	
}
