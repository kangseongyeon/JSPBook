package kr.or.ddit.index;

import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.vo.IndexVO;

public class IndexRepository {
	private List<IndexVO> indexList = new ArrayList<IndexVO>();
	
	// 싱글톤
	private static IndexRepository instance = null;
	public static IndexRepository getInstance() {
		if(instance == null) {
			instance = new IndexRepository();
		}
		return instance;
	}
	
	
	// InMemory 내, 챕터, 제목, 챕터별 URL, 챕터별 소스 페이지 정보를 담기 위해 준비
	private IndexRepository() {
		// 챕터 설정
		String[] chapters = {
				"CH01", "CH02", "CH03", "CH04","CH05", "CH06","CH07", 
				"CH08", "CH10", "CH11", "CH12","CH13", "CH14","CH17"
		};
		// 제목 설정
		String[] titles = {
				"CH01. JSP 개요", "CH02. 스크립트 태그", "CH03. 디렉티브 태그", "CH04. 액션 태그",
				"CH05. 내장객체", "CH06. 폼 태그", "CH07. 파일 업로드", "CH08. 유효성 검사",
				"CH10. 시큐리티", "CH11. 예외처리", "CH12. 필터", "CH13. 세션", "CH14. 쿠키", "CH17. 태그 라이브러리"
		};
		// 챕터별 URL 설정
		String[] chapterMoveUrls = {
				"/welcome.jsp", "/ch02/scriptlet01.jsp", "/ch03/page_import.jsp", "",
				"", "", "", "",
				"", "", "", "",
				"", ""
		};
		// 챕터별 소스페이지 설정
		String [][] sourceArr = {
				{"welcome.jsp"},							// ch01
				{
					"declaration01.jsp", "declaration02.jsp", "declaration03.jsp",
					"scriptlet01.jsp", "scriptlet02.jsp", "expression01.jsp", 
					"ch02_test_my.jsp"
				},					// ch02
				{
					"page_import.jsp", "page_buffer.jsp",
					"page_errorPage.jsp", "page_errorPage_error.jsp",
					"page_isErrorPage.jsp", "page_isErrorPage_error.jsp",
					"include01.jsp", "include01 header.jsp",
					"include02.jsp", "include02_header.jsp", "include02_footer.jsp",
					"taglib.jsp", "ch03_test.jsp"
				},					// ch03
				{""},					// ch04
				{""},					// ch05
				{""},					// ch06
				{""},					// ch07
				{""},					// ch08
				{""},					// ch10
				{""},					// ch11
				{""},					// ch12
				{""},					// ch13
				{""},					// ch14
				{""},					// ch17
		};
		
		// 정보를 담은 List 설정
		for (int i=0; i<chapters.length; i++) {
			IndexVO indexVO = new IndexVO();
			indexVO.setChapter(chapters[i]);				// 챕터 등록
			indexVO.setTitle(titles[i]);					// 챕터명 등록
			indexVO.setChapterMoveUrl(chapterMoveUrls[i]);	// 챕터 이동 URL 등록
			
			List<String> sourceList	 = new ArrayList<String>();
			for (int j=0; j<sourceArr[i].length; j++) {
				sourceList.add(sourceArr[i][j]);
			}
			indexVO.setSourceList(sourceList);
			indexList.add(indexVO);
		}
	}
	
	// 챕터 데이터 전체 가져오기
	public List<IndexVO> getIndexList() {
		return indexList;
	}
}
