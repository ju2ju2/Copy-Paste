/*
* @Class : NoteMailnFileService
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : 노트메일 파일다운로드
* */

package tk.copyNpaste.note;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.protobuf.ByteString;

import tk.copyNpaste.vo.NoteVO;

@Service

public class NoteVisionService {

	// 노트 비젼api 문자인식
	public String vision(String userEmail, MultipartHttpServletRequest req)
			throws Exception, IOException {
		String text="";
		//request 영역에서 파일 가져오기
		MultipartFile multipartFile = req.getFile("visionImg");
		//멀티파트 파일>>파일로 변환
		File file= multipartToFile(multipartFile);
		
		/* 필요시 저장된 경로에서 파일 불러오기
		 * String saveDir = req.getServletContext().getRealPath("resources/image/vision");*/

    	//비전 api 파일 가져오기
		List<AnnotateImageRequest> requests = new ArrayList<>();
		//파일 스트림>>base64로 변환
		ByteString imgBytes = ByteString.readFrom(new FileInputStream(file));

		Image img = Image.newBuilder().setContent(imgBytes).build();
		Feature feat = Feature.newBuilder().setType(Type.TEXT_DETECTION).build();
		AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		requests.add(request);

		//vision api 요청
		try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
			BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = response.getResponsesList();

			for (AnnotateImageResponse res : responses) {
				if (res.hasError()) {
					System.out.printf("Error: %s\n", res.getError().getMessage());
					return "";
				}

				// For full list of available annotations, see http://g.co/cloud/vision/docs
				for (EntityAnnotation annotation : res.getTextAnnotationsList()) {
					/*System.out.printf("Text: %s\n", annotation.getDescription());*/
					text = annotation.getDescription();
					System.out.println(text);
					return text;
				}
			}
		}
		return text;

	}
	// multipartFile>>File convert 함수 (for vision api inputstream)
	public File multipartToFile(MultipartFile multipart) 
	{
	        File convFile = new File( multipart.getOriginalFilename());
	        try {
				multipart.transferTo(convFile);
			} catch (IllegalStateException e) {
			} catch (IOException e) {
			}
	        return convFile;
	}
	 

}
