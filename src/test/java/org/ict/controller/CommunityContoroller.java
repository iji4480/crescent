package org.ict.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
public class CommunityContoroller {
	
	@Autowired
	private WebApplicationContext ctx;

	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testNoticeList() throws Exception {
		
		mockMvc.perform(
			MockMvcRequestBuilders.get("/community/notice").param("page", "1").param("number", "5"))
				.andReturn().getModelAndView().getModelMap();
	}
	
//	@Test
	public void testNoticeDetail() throws Exception {
		mockMvc.perform(
				MockMvcRequestBuilders.get("/community/noticedetail").param("nno", "4"))
					.andReturn().getModelAndView().getModelMap();
	}
	
//	@Test
	public void testNoticeWrite() throws Exception {
		mockMvc.perform(
			MockMvcRequestBuilders.post("/community/write").param("ntitle", "Mock 공지 테스트 제목").param("ncontent", "Mock 공지 테스트 본문"))
				.andReturn().getModelAndView().getViewName();
	}
	
//	@Test
	public void testNoticeModify() throws Exception {
		mockMvc.perform(
				MockMvcRequestBuilders.post("/community/modifyrun").param("nno", "4")
					.param("ntitle", "Mock 공지 테스트 수정 제목").param("ncontent", "Mock 공지 테스트 수정 본문"))
					.andReturn().getModelAndView().getViewName();
	}
	
//	@Test
	public void testNoticeRemove() throws Exception {
		mockMvc.perform(
				MockMvcRequestBuilders.post("/community/remove").param("nno", "3"))
					.andReturn().getModelAndView().getViewName();
	}
}
