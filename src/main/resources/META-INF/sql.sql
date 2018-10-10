use copynpaste;

-- 주제_코드성
CREATE TABLE `subject` (
   `subjectCode` VARCHAR(30) NOT NULL COMMENT '주제코드', -- 주제코드
   `subjectName` VARCHAR(30) NULL     COMMENT '주제코드명' -- 주제코드명
)
COMMENT '주제_코드성';

-- 주제_코드성
ALTER TABLE `subject`
   ADD CONSTRAINT `PK_subject` -- 주제_코드성 기본키
      PRIMARY KEY (
         `subjectCode` -- 주제코드
      );
-- 주제_코드성_값
INSERT INTO subject(subjectCode,subjectName) 
VALUES ('SJ00','기타');
INSERT INTO subject(subjectCode,subjectName) 
VALUES ('SJ01','회사');
INSERT INTO subject(subjectCode,subjectName) 
VALUES ('SJ02','생활');
INSERT INTO subject(subjectCode,subjectName) 
VALUES ('SJ03','교육');
      
-- 처리상태_코드성
CREATE TABLE `PScheck` (
   `checkCode` VARCHAR(30) NOT NULL COMMENT '신고처리상태코드', -- 신고처리상태코드
   `checkName` VARCHAR(30) NULL     COMMENT '신고처리상태코드명' -- 신고처리상태코드명
)
COMMENT '처리상태_코드성';

-- 처리상태_코드성
ALTER TABLE `PScheck`
   ADD CONSTRAINT `PK_check` -- 처리상태_코드성 기본키
      PRIMARY KEY (
         `checkCode` -- 신고처리상태코드
      );
-- 처리상태_코드성_값
INSERT INTO PScheck(checkCode,checkName) 
VALUES ('PS00','완료');
INSERT INTO PScheck(checkCode,checkName) 
VALUES ('PS01','블라인드');
INSERT INTO PScheck(checkCode,checkName) 
VALUES ('PS02','미확인');



-- 신고사유_코드성
CREATE TABLE `reportCause` (
   `reportCauseCode`  VARCHAR(30)  NOT NULL COMMENT '신고사유코드', -- 신고사유코드
   `reportCauseTitle` VARCHAR(100) NULL     COMMENT '신고사유제목' -- 신고사유제목
)
COMMENT '신고사유_코드성';

-- 신고사유_코드성
ALTER TABLE `reportCause`
   ADD CONSTRAINT `PK_reportCause` -- 신고사유_코드성 기본키
      PRIMARY KEY (
         `reportCauseCode` -- 신고사유코드
      );

--신고사유_코드성_값
INSERT INTO reportCause(reportCauseCode,reportCauseTitle) 
VALUES ('NR00','기타');
INSERT INTO reportCause(reportCauseCode,reportCauseTitle) 
VALUES ('NR01','광고/음란성 게시물');
INSERT INTO reportCause(reportCauseCode,reportCauseTitle) 
VALUES ('NR02','욕설 및 부적절한 언어');
INSERT INTO reportCause(reportCauseCode,reportCauseTitle) 
VALUES ('NR03','회원 비방');
INSERT INTO reportCause(reportCauseCode,reportCauseTitle) 
VALUES ('NR04','명예훼손/저작권 침해');


-- 노트댓글여부_코드성
CREATE TABLE `noteOrComm` (
   `noteOrCommCode`  VARCHAR(30)         NOT NULL COMMENT '여부코드', -- 여부코드
   `noteOrComm`     VARCHAR(30) NULL     COMMENT '여부코드명' -- 여부코드명
)
COMMENT '노트댓글여부_코드성';

-- 노트댓글여부_코드성
ALTER TABLE `noteOrComm`
   ADD CONSTRAINT `PK_noteOrComm` -- 노트댓글여부_코드성 기본키
      PRIMARY KEY (
         `noteOrCommCode` -- 여부코드
      );
      
-- 노트댓글여부_코드성_값
INSERT INTO noteOrComm(noteOrCommCode,noteOrComm) 
VALUES ('NC00','노트');
INSERT INTO noteOrComm(noteOrCommCode,noteOrComm) 
VALUES ('NC01','댓글');

-- 사용자권한_코드성
CREATE TABLE `userRolls` (
   `rollCode` VARCHAR(30) NOT NULL COMMENT '권한코드', -- 권한코드
   `rollName` VARCHAR(50) NULL     COMMENT '권한명' -- 권한명
)
COMMENT '사용자권한';

-- 사용자권한_코드성
ALTER TABLE `userRolls`
   ADD CONSTRAINT `PK_userRolls` -- 사용자권한 기본키
      PRIMARY KEY (
         `rollCode` -- 권한코드
      );
-- 사용자권한_코드성_값
INSERT INTO userRolls(rollCode,rollName) 
VALUES ('ROLE_USER','일반회원');
INSERT INTO userRolls(rollCode,rollName) 
VALUES ('ROLE_ADMIN','관리자');


-- 회원
CREATE TABLE `users` (
   `userEmail`   VARCHAR(100) NOT NULL COMMENT '회원이메일', -- 회원이메일
   `userNick`    VARCHAR(50)  NOT NULL COMMENT '회원닉네임', -- 회원닉네임
   `userPwd`     VARCHAR(100) NOT NULL COMMENT '회원비밀번호', -- 회원비밀번호
   `userPhoto`   TEXT         NULL     COMMENT '회원프로필사진', -- 회원프로필사진
   `userDate`    DATE         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '회원가입일자', -- 회원가입일자
   `userEnabled` TINYINT(1)   NOT NULL DEFAULT 1 COMMENT '사용여부' -- 사용여부
)
COMMENT '회원';

-- 회원
ALTER TABLE `users`
   ADD CONSTRAINT `PK_users` -- 회원 기본키
      PRIMARY KEY (
         `userEmail` -- 회원이메일
      );

-- 드래그
CREATE TABLE `drag` (
   `dragNum`    INT          NOT NULL auto_increment primary key COMMENT '드래그번호', -- 드래그번호
   `userEmail`  VARCHAR(100) NOT NULL COMMENT '회원이메일', -- 회원이메일
   `dragText`   LONGTEXT     NOT NULL COMMENT '텍스트', -- 텍스트
   `dragOrigin` TEXT         NULL     COMMENT '출처', -- 출처
   `dragDate`   DATE         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '드래그일자', -- 드래그일자
   `dragMark`   TINYINT(1)   NOT NULL DEFAULT 0 COMMENT '중요표시' -- 중요표시
)
COMMENT '드래그';


-- 노트
CREATE TABLE `note` (
   `noteNum`     INT          NOT NULL auto_increment primary key COMMENT '노트번호', -- 노트번호
   `folderName`  VARCHAR(50)  NOT NULL COMMENT '폴더명', -- 폴더명
   `userEmail`   VARCHAR(100) NOT NULL COMMENT '회원이메일', -- 회원이메일
   `noteTitle`   VARCHAR(100) NOT NULL COMMENT '노트제목', -- 노트제목
   `noteContent` LONGTEXT     NOT NULL COMMENT '노트내용', -- 노트내용
   `noteDate`    DATE         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성일', -- 작성일
   `subjectCode` VARCHAR(30)  NOT NULL DEFAULT 'SJ00' COMMENT '주제코드', -- 주제코드
   `noteCount`   TINYINT(1)   NULL     DEFAULT 0 COMMENT '참조카운트', -- 참조카운트
   `notePublic`  TINYINT(1)   NULL     DEFAULT 1 COMMENT '글공개여부', -- 글공개여부
   `notescrap`   TINYINT(1)   NULL     DEFAULT 0 COMMENT '스크랩', -- 스크랩
   `notePNum`    INT          NULL     COMMENT '부모노트번호' -- 부모노트번호
)
COMMENT '노트';


-- QnA
CREATE TABLE `QNA` (
   `qnaNum`     INT          NOT NULL auto_increment primary key COMMENT 'QnA번호', -- QnA번호
   `userEmail`  VARCHAR(100) NOT NULL COMMENT '회원이메일', -- 회원이메일
   `qnaTitle`   VARCHAR(100) NOT NULL COMMENT 'QnA제목', -- QnA제목
   `qnaContent` LONGTEXT     NOT NULL COMMENT 'QnA내용', -- QnA내용
   `qnaDate`    DATE         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'QnA작성일', -- QnA작성일
   `qnaDept`    INT          NULL     DEFAULT 0 COMMENT '답글깊이', -- 답글깊이
   `qnaPNum`    INT          NULL     COMMENT '부모qna번호', -- 부모qna번호
   `qnaNotice`  TINYINT(1)   NULL     DEFAULT 0 COMMENT '공지글여부', -- 공지글여부
   `qnaSecret`  TINYINT(1)   NULL     DEFAULT 1 COMMENT '비밀글여부' -- 비밀글여부
)
COMMENT 'QnA';


-- 노트&댓글신고
CREATE TABLE `report` (
   `reportNum`        INT          NOT NULL auto_increment primary key COMMENT '신고게시판글번호', -- 신고게시판글번호
   `userEmail`        VARCHAR(100) NOT NULL COMMENT '신고한회원이메일', -- 신고한회원이메일
   `noteNum`          INT          NOT NULL COMMENT '노트or댓글번호', -- 노트or댓글번호
   `checkCode`        VARCHAR(30)  NOT NULL DEFAULT 'PS00' COMMENT '신고처리상태코드', -- 신고처리상태코드
   `reportInDate`     DATE         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '신고일', -- 신고일
   `reportHandleDate` DATE         NOT NULL COMMENT '처리일', -- 처리일
   `reportCauseCode`  VARCHAR(30)  NOT NULL COMMENT '신고사유코드', -- 신고사유코드
   `reportContent`    TEXT         NULL     COMMENT '신고내용', -- 신고내용
   `reportmemo`       TEXT         NULL     COMMENT '메모', -- 메모
   `noteOrCommCode`   VARCHAR(30)  NOT NULL COMMENT '노트댓글여부코드' -- 노트댓글여부코드
)
COMMENT '노트&댓글신고';

-- 댓글
CREATE TABLE `noteComm` (
   `noteCommNum`  INT          NOT NULL auto_increment primary key COMMENT '댓글번호', -- 댓글번호
   `userEmail`    VARCHAR(100) NOT NULL COMMENT '회원이메일', -- 회원이메일
   `noteNum`      INT          NOT NULL COMMENT '노트번호', -- 노트번호
   `commDept`     INT          NULL     DEFAULT 0 COMMENT '댓글깊이', -- 댓글깊이
   `commContent`  TEXT         NULL     COMMENT '댓글내용', -- 댓글내용
   `commDate`     DATE         NULL     DEFAULT CURRENT_TIMESTAMP COMMENT '댓글작성일', -- 댓글작성일
   `noteCommPNum` INT          NULL     COMMENT '부모댓글번호' -- 부모댓글번호
)
COMMENT '댓글';


-- 폴더
CREATE TABLE `folder` (
   `folderName`    VARCHAR(50)  NOT NULL COMMENT '폴더명', -- 폴더명
   `userEmail`     VARCHAR(100) NOT NULL COMMENT '회원이메일', -- 회원이메일
   `defaultFolder` TINYINT(1)   NULL     DEFAULT 0 COMMENT '디폴트폴더', -- 디폴트폴더
   `candelete`     TINYINT(1)   NULL     DEFAULT 0 COMMENT '폴더삭제여부' -- 폴더삭제여부
)
COMMENT '폴더';

-- 폴더
ALTER TABLE `folder`
   ADD CONSTRAINT `PK_folder` -- 폴더 기본키
      PRIMARY KEY (
         `folderName`, -- 폴더명
         `userEmail`   -- 회원이메일
      );




-- QnA댓글
CREATE TABLE `QNAComm` (
   `qnaCommNum`     INT          NOT NULL auto_increment primary key COMMENT 'QnA댓글번호', -- QnA댓글번호
   `qnaNum`         INT          NOT NULL COMMENT 'QnA글번호', -- QnA번호
   `userEmail`      VARCHAR(100) NOT NULL COMMENT '회원이메일', -- 회원이메일
   `qnaCommContent` LONGTEXT     NULL     COMMENT '댓글내용', -- 댓글내용
   `qnaCommDate`    DATE         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '댓글작성일', -- 댓글작성일
   `qnaCommDept`    INT          NULL     DEFAULT 0 COMMENT '댓글깊이', -- 댓글깊이
   `qnaCommPNum`    INT          NULL     COMMENT '부모댓글번호' -- 부모댓글번호
)
COMMENT 'QnA댓글';


-- 역할
CREATE TABLE `rolls` (
   `userEmail` VARCHAR(100) NOT NULL COMMENT '회원이메일', -- 회원이메일
   `rollCode`  VARCHAR(30)  NOT NULL DEFAULT 'ROLE_USER' COMMENT '권한코드' -- 권한코드
)
COMMENT '역할';

-- 역할
ALTER TABLE `rolls`
   ADD CONSTRAINT `PK_rolls` -- 역할 기본키
      PRIMARY KEY (
         `userEmail`, -- 회원이메일
         `rollCode`   -- 권한코드
      );

-- 드래그
ALTER TABLE `drag`
   ADD CONSTRAINT `FK_users_TO_drag` -- 회원 -> 드래그
      FOREIGN KEY (
         `userEmail` -- 회원이메일
      )
      REFERENCES `users` ( -- 회원
         `userEmail` -- 회원이메일
      );

-- 노트
ALTER TABLE `note`
   ADD CONSTRAINT `FK_folder_TO_note` -- 폴더 -> 노트
      FOREIGN KEY (
         `folderName`, -- 폴더명
         `userEmail`   -- 회원이메일
      )
      REFERENCES `folder` ( -- 폴더
         `folderName`, -- 폴더명
         `userEmail`   -- 회원이메일
      );

-- 노트
ALTER TABLE `note`
   ADD CONSTRAINT `FK_subject_TO_note` -- 주제_코드성 -> 노트
      FOREIGN KEY (
         `subjectCode` -- 주제코드
      )
      REFERENCES `subject` ( -- 주제_코드성
         `subjectCode` -- 주제코드
      );

-- 노트
ALTER TABLE `note`
   ADD CONSTRAINT `FK_note_TO_note` -- 노트 -> 노트
      FOREIGN KEY (
         `notePNum` -- 부모노트번호
      )
      REFERENCES `note` ( -- 노트
         `noteNum` -- 노트번호
      );

-- QnA
ALTER TABLE `QNA`
   ADD CONSTRAINT `FK_users_TO_QNA` -- 회원 -> QnA
      FOREIGN KEY (
         `userEmail` -- 회원이메일
      )
      REFERENCES `users` ( -- 회원
         `userEmail` -- 회원이메일
      );

-- QnA
ALTER TABLE `QNA`
   ADD CONSTRAINT `FK_QNA_TO_QNA` -- QnA -> QnA
      FOREIGN KEY (
         `qnaPNum` -- 부모qna번호
      )
      REFERENCES `QNA` ( -- QnA
         `qnaNum` -- QnA번호
      );

-- 노트&댓글신고
ALTER TABLE `report`
   ADD CONSTRAINT `FK_users_TO_report` -- 회원 -> 노트&댓글신고
      FOREIGN KEY (
         `userEmail` -- 신고한회원이메일
      )
      REFERENCES `users` ( -- 회원
         `userEmail` -- 회원이메일
      );

-- 노트&댓글신고
ALTER TABLE `report`
   ADD CONSTRAINT `FK_note_TO_report` -- 노트 -> 노트&댓글신고
      FOREIGN KEY (
         `noteNum` -- 노트or댓글번호
      )
      REFERENCES `note` ( -- 노트
         `noteNum` -- 노트번호
      );

-- 노트&댓글신고
ALTER TABLE `report`
   ADD CONSTRAINT `FK_check_TO_report` -- 처리상태_코드성 -> 노트&댓글신고
      FOREIGN KEY (
         `checkCode` -- 신고처리상태코드
      )
      REFERENCES `check` ( -- 처리상태_코드성
         `checkCode` -- 신고처리상태코드
      );

-- 노트&댓글신고
ALTER TABLE `report`
   ADD CONSTRAINT `FK_reportCause_TO_report` -- 신고사유_코드성 -> 노트&댓글신고
      FOREIGN KEY (
         `reportCauseCode` -- 신고사유코드
      )
      REFERENCES `reportCause` ( -- 신고사유_코드성
         `reportCauseCode` -- 신고사유코드
      );

-- 노트&댓글신고
ALTER TABLE `report`
   ADD CONSTRAINT `FK_noteOrComm_TO_report` -- 노트댓글여부_코드성 -> 노트&댓글신고
      FOREIGN KEY (
         `noteOrCommCode` -- 노트댓글여부코드
      )
      REFERENCES `noteOrComm` ( -- 노트댓글여부_코드성
         `noteOrCommCode` -- 여부코드
      );

-- 댓글
ALTER TABLE `noteComm`
   ADD CONSTRAINT `FK_note_TO_noteComm` -- 노트 -> 댓글
      FOREIGN KEY (
         `noteNum` -- 노트번호
      )
      REFERENCES `note` ( -- 노트
         `noteNum` -- 노트번호
      );

-- 댓글
ALTER TABLE `noteComm`
   ADD CONSTRAINT `FK_users_TO_noteComm` -- 회원 -> 댓글
      FOREIGN KEY (
         `userEmail` -- 회원이메일
      )
      REFERENCES `users` ( -- 회원
         `userEmail` -- 회원이메일
      );

-- 댓글
ALTER TABLE `noteComm`
   ADD CONSTRAINT `FK_noteComm_TO_noteComm` -- 댓글 -> 댓글
      FOREIGN KEY (
         `noteCommPNum` -- 부모댓글번호
      )
      REFERENCES `noteComm` ( -- 댓글
         `noteCommNum` -- 댓글번호
      );

-- 폴더
ALTER TABLE `folder`
   ADD CONSTRAINT `FK_users_TO_folder` -- 회원 -> 폴더
      FOREIGN KEY (
         `userEmail` -- 회원이메일
      )
      REFERENCES `users` ( -- 회원
         `userEmail` -- 회원이메일
      );

-- QnA댓글
ALTER TABLE `QNAComm`
   ADD CONSTRAINT `FK_QNA_TO_QNAComm` -- QnA -> QnA댓글
      FOREIGN KEY (
         `qnaNum` -- QnA번호
      )
      REFERENCES `QNA` ( -- QnA
         `qnaNum` -- QnA번호
      );

-- QnA댓글
ALTER TABLE `QNAComm`
   ADD CONSTRAINT `FK_users_TO_QNAComm` -- 회원 -> QnA댓글
      FOREIGN KEY (
         `userEmail` -- 회원이메일
      )
      REFERENCES `users` ( -- 회원
         `userEmail` -- 회원이메일
      );

-- QnA댓글
ALTER TABLE `QNAComm`
   ADD CONSTRAINT `FK_QNAComm_TO_QNAComm` -- QnA댓글 -> QnA댓글
      FOREIGN KEY (
         `qnaCommPNum` -- 부모댓글번호
      )
      REFERENCES `QNAComm` ( -- QnA댓글
         `qnaCommNum` -- QnA댓글번호
      );

-- 역할
ALTER TABLE `rolls`
   ADD CONSTRAINT `FK_users_TO_rolls` -- 회원 -> 역할
      FOREIGN KEY (
         `userEmail` -- 회원이메일
      )
      REFERENCES `users` ( -- 회원
         `userEmail` -- 회원이메일
      );

-- 역할
ALTER TABLE `rolls`
   ADD CONSTRAINT `FK_userRolls_TO_rolls` -- 사용자권한 -> 역할
      FOREIGN KEY (
         `rollCode` -- 권한코드
      )
      REFERENCES `userRolls` ( -- 사용자권한
         `rollCode` -- 권한코드
      );