package com.qst.filter;

import javax.servlet.*;
import java.io.IOException;

/**
 * Class CharacterEncodingFilter
 *
 * @author acfan
 * @description 字符编码过滤器
 * @date 2020/10/17
 */
public class CharacterEncodingFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("Character Encoding Filter Initialized.");
    }


    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        System.out.println("Character Encoding Filter Destroyed.");
    }
}