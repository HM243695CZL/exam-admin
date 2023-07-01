package com.hl.yyx.common.util;

import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;

import java.io.FileInputStream;
import java.io.IOException;

public class DocUtil {

	public static void main(String[] args) throws IOException {
		FileInputStream fileInputStream= new FileInputStream("D:\\01 常识  上册（192页）.docx");
		XWPFWordExtractor docx = new XWPFWordExtractor(new XWPFDocument(fileInputStream));
		String text = docx.getText();
		System.out.println(text);

	}
}