/*
* @Class : AspectNote
* @ Date : 2018.11.05
* @ Author : 우나연
* @ Desc : 참조 카운트 Aspectj 핸들러.
*/
package tk.copyNpaste.note;

import org.apache.ibatis.session.SqlSession;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;

import tk.copyNpaste.mapper.NoteMapper;

@Aspect
@Component
@Configuration
@EnableAspectJAutoProxy
@ComponentScan(basePackages = "tk.copyNpaste.note.")
public class AspectNote {

	@Autowired
	private SqlSession sqlsession;
	 
	@Pointcut("execution(* tk.copyNpaste.note.NoteMailnFileService.*(..))")
    private void onNoteFileMailMethod(){}//파일다운로드,메일 전송시
	
	@Pointcut("execution(* tk.copyNpaste.note.NoteService.*Aspect(..))")
    private void onUpConuntMethod(){}//스크랩,바로작성하기
	
	 /*|| onUpConuntMethod()*/
	@AfterReturning(value ="onNoteFileMailMethod() || onUpConuntMethod() ", returning="returnValue")
	public int updateNoteCount(Object returnValue) throws Exception { 
		NoteMapper notedao = sqlsession.getMapper(NoteMapper.class);
		return notedao.updateNoteCount(returnValue);
	}

	
	
}
