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

public class NoteVisionSpellService {

	// 노트 비젼api 문자인식
	public String vision(String userEmail, MultipartHttpServletRequest req)
			throws Exception, IOException {

		// ① 파일명 가져오기
		String fileName = req.getParameter("visionImg");
		System.out.println("파일명 : " + fileName);
		// ② 경로 가져오기
		String saveDir = req.getServletContext().getRealPath("resources/image/vision");
		File file = new File(saveDir + "/" + fileName);
		System.out.println("파일경로: " + file.getPath());
		
		
		
    	//비전 api 파일 가져오기
		List<AnnotateImageRequest> requests = new ArrayList<>();
		
	/*	String filePath = req.getServletContext().getRealPath("resources/image/logo.png");
	*/
			ByteString imgBytes = ByteString.readFrom(new FileInputStream(req.getParameter("visionImg")));

		
		Image img = Image.newBuilder().setContent(imgBytes).build();
		Feature feat = Feature.newBuilder().setType(Type.TEXT_DETECTION).build();
		AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		requests.add(request);

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
					System.out.printf("Text: %s\n", annotation.getDescription());
					return annotation.getDescription();
				}
			}
		}
		return "";
		
/*	// 노트 비젼api 문자인식 sample 되는거
	public void vision(NoteVO note,HttpServletRequest req)
			throws Exception, IOException {

		List<AnnotateImageRequest> requests = new ArrayList<>();
		String filePath = req.getSession().getServletContext().getRealPath("resources/image/logo.png");
		ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));

		Image img = Image.newBuilder().setContent(imgBytes).build();
		Feature feat = Feature.newBuilder().setType(Type.TEXT_DETECTION).build();
		AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		requests.add(request);

		try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
			BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = response.getResponsesList();

			for (AnnotateImageResponse res : responses) {
				if (res.hasError()) {
					System.out.printf("Error: %s\n", res.getError().getMessage());
					return;
				}

				// For full list of available annotations, see http://g.co/cloud/vision/docs
				for (EntityAnnotation annotation : res.getTextAnnotationsList()) {
					System.out.printf("Text: %s\n", annotation.getDescription());
				}
			}
		}
*/
		// [END vision_text_detection]

		/*
		 * try { String src ="";
		 * 
		 * String NoteContent = note.getNoteContent(); Document doc =
		 * Jsoup.parseBodyFragment(NoteContent); Elements imgs =
		 * doc.getElementsByTag("img"); if(imgs.size() > 0) { src =
		 * imgs.get(0).attr("src"); src.replaceAll("data:image/jpeg;base64,", "");
		 * System.out.println(src); }
		 * 
		 * 
		 * String imageFilePath = req.getContextPath()+"/resources/image/logo.png"; //여기
		 * 설정해줘야함(test이미지 경로)
		 * 
		 * List<AnnotateImageRequest> requests = new ArrayList<>(); ByteString imgBytes
		 * = ByteString.copyFromUtf8(src); ByteString imgBytes = ByteString.readFrom(new
		 * FileInputStream(imageFilePath));
		 * 
		 * Image img = Image.newBuilder().setContent(imgBytes).build(); Feature feat =
		 * Feature.newBuilder().setType(Type.TEXT_DETECTION).build();
		 * AnnotateImageRequest request =
		 * AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		 * requests.add(request);
		 * 
		 * List<AnnotateImageRequest> requests = new ArrayList<>(); String filePath =
		 * req.getContextPath()+"/resources/image/logo.png"; Image img=
		 * getImage(filePath);
		 * 
		 * Feature feat = Feature.newBuilder().setType(Type.TEXT_DETECTION).build();
		 * AnnotateImageRequest request =
		 * AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		 * requests.add(request);
		 * 
		 * 
		 * try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
		 * BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
		 * List<AnnotateImageResponse> responses = response.getResponsesList();
		 * 
		 * for (AnnotateImageResponse res : responses) { if (res.hasError()) {
		 * System.out.printf("Error: %s\n", res.getError().getMessage()); return ""; }
		 * 
		 * System.out.println("Text : ");
		 * System.out.println(res.getTextAnnotationsList().get(0).getDescription());
		 * 
		 * // For full list of available annotations, see http://g.co/cloud/vision/docs
		 * for (EntityAnnotation annotation : res.getTextAnnotationsList()) {
		 * 
		 * //System.out.printf("Text: %s\n", annotation.getDescription());
		 * //System.out.printf("Position : %s\n", annotation.getBoundingPoly()); } } } }
		 * catch(Exception e) { e.printStackTrace(); e.getMessage(); }
		 */

	}

	// 노트맞춤법검사
	public NoteVO spell(NoteVO note) throws Exception {
		return null;
	}

}
