package com.company.cktree.test;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	
	@Inject
	private TestService testService;
	
	@RequestMapping("/listTest")
	public String listTest(Model test) {
		List<TestDTO> list = testService.listTest();
		test.addAttribute("test",list);
		return "test/test";
	}
}
