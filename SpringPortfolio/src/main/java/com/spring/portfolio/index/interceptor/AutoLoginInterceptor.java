package com.spring.portfolio.index.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.portfolio.account.model.AccountDTO;
import com.spring.portfolio.account.service.AccountService;
import com.spring.portfolio.common.exception.account.AutoLoginOffException;
import com.spring.portfolio.common.namespace.ServiceNameSpaces;
import com.spring.portfolio.common.namespace.UtilNameSpaces;
import com.spring.portfolio.common.util.account.AccountUtility;

public class AutoLoginInterceptor extends HandlerInterceptorAdapter {
	@Resource(name = ServiceNameSpaces.ACCOUNT)
	private AccountService accountService;
	@Resource(name = UtilNameSpaces.ACCOUN)
	private AccountUtility accountUtil;

	public AutoLoginInterceptor() {
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Cookie cookie = accountUtil.getCookie(request.getCookies());
		HttpSession sess = null;
		AccountDTO dto = null;
		if (accountUtil.cookieCheck(cookie)) {
			try {
				int i = 0;
				String a_jsession_id = cookie.getValue();
				dto = accountService.getOne(a_jsession_id);
				if (dto != null) {
					int a_holding_time = dto.getA_holding_time();
					dto.setA_holding_time(accountUtil.getHoldingTime());
					i = accountUtil.lifeTimeCheck(a_holding_time) ? accountService.modify(dto)
							: accountService.remove(dto);
				}
				if (i != 1)
					throw new AutoLoginOffException();
				sess = request.getSession();
				sess.setAttribute("login", dto);
			} catch (AutoLoginOffException e) {
				accountUtil.cookieDelete(response, cookie);
				sess = request.getSession();
				sess.invalidate();
			}
		}
		return true;
	}
}
