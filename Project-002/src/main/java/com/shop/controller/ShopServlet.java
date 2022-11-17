package com.shop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.controller.action.Action;

@WebServlet("/ShopServlet")
public class ShopServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doGet(HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException {
	 //Command 요청 이클립스 Console 내 확인 
	String command = request.getParameter("command");
    System.out.println("ShopServlet에서 요청을 받음을 확인 : " + command);

    ActionFactory af = ActionFactory.getInstance();
    Action action = af.getAction(command);

    if (action != null) {
      action.execute(request, response);
    }
  }
//한글 깨짐 방지 코드 , doPost 방식으로 호출되어도 doGet으로 요청 처리
  protected void doPost(HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    doGet(request, response);
  }
}
