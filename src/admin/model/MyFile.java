package admin.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class MyFile {
	public void saveFile(File file, String path, String fileName) throws IOException {
		FileInputStream inputStream = new FileInputStream(file);
		FileOutputStream outputStream = new FileOutputStream(path + fileName);
		int bytesRead = 0;
		byte[] buffer = new byte[1024];
		while ((bytesRead = inputStream.read(buffer, 0, 1024)) != -1) {
			outputStream.write(buffer, 0, bytesRead);
		}
		inputStream.close();
		outputStream.close();
	}
}
