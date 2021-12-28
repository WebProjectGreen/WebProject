package com.project.catdog.Command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface MainCommand {
	public void execute(Model model, HttpServletRequest request);
}
