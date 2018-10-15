/*
* @Class : NoteMailnFileService
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : 노트메일 파일다운로드
*/
package tk.copyNpaste.note;

import org.springframework.stereotype.Service;

import tk.copyNpaste.mapper.NoteMapper;
import tk.copyNpaste.vo.NoteVO;

@Service
public class NoteMailnFileService {
	
	NoteMapper notedao;


	//노트 메일 전송
	public NoteVO emailNote(NoteVO note) throws Exception {
		return null;
	}
	
	//노트 pdf파일로 다운로드
	public NoteVO pdfDownNote(NoteVO note) throws Exception {
		return null;
	}
	
	//노트 xls파일로 다운로드
	public NoteVO xlsDownNote(NoteVO note) throws Exception {
		return null;
	}
	
	//노트 hwp파일로 다운로드
	public NoteVO hwpDownNote(NoteVO note) throws Exception {
		return null;
	}

	
}
