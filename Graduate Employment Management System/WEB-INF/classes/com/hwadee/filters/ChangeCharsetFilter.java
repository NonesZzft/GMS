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
 * 自定义的实现javax.servlet.Filter接口的字符编码过滤器, 用于对请求和响应的内容重新编码，以避免乱码。
 */
public class ChangeCharsetFilter implements Filter {
	protected String encoding = null;// 要指定的编码，在web.xml中配置
	protected FilterConfig filterConfig = null;

	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
		this.encoding = filterConfig.getInitParameter("encoding");// /得到在web.xml中配置的编码
		// System.out.println("ChangeCharsetFilter的init方法中得到的编码方式：" + encoding);
	}

	protected String getEncoding() {
		return (this.encoding);// 得到指定的编码
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		if (request.getCharacterEncoding() == null) {
			String encoding = getEncoding();// //得到指定的编码名字
			if (encoding != null)
				request.setCharacterEncoding(encoding);// //设置request的编码
		}
//		System.out.println("doFilter方法中得到/设置的编码方式：" + encoding);
		chain.doFilter(request, response);// 有机会执行下一个filter
	}

	public void destroy() {
		this.encoding = null;
		this.filterConfig = null;
	}
}
