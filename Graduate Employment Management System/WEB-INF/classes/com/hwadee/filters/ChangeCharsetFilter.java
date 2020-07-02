package com.hwadee.filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * �Զ����ʵ��javax.servlet.Filter�ӿڵ��ַ����������, ���ڶ��������Ӧ���������±��룬�Ա������롣
 */
public class ChangeCharsetFilter implements Filter {
	protected String encoding = null;// Ҫָ���ı��룬��web.xml������
	protected FilterConfig filterConfig = null;

	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
		this.encoding = filterConfig.getInitParameter("encoding");// /�õ���web.xml�����õı���
		// System.out.println("ChangeCharsetFilter��init�����еõ��ı��뷽ʽ��" + encoding);
	}

	protected String getEncoding() {
		return (this.encoding);// �õ�ָ���ı���
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		if (request.getCharacterEncoding() == null) {
			String encoding = getEncoding();// //�õ�ָ���ı�������
			if (encoding != null)
				request.setCharacterEncoding(encoding);// //����request�ı���
		}
//		System.out.println("doFilter�����еõ�/���õı��뷽ʽ��" + encoding);
		chain.doFilter(request, response);// �л���ִ����һ��filter
	}

	public void destroy() {
		this.encoding = null;
		this.filterConfig = null;
	}
}
