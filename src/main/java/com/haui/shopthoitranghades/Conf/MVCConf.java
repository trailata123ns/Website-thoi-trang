package com.haui.shopthoitranghades.Conf;

import com.github.messenger4j.Messenger;
import com.haui.shopthoitranghades.Dto.Constants;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
public class MVCConf implements WebMvcConfigurer , Constants {
    @Override
    public void addResourceHandlers(final ResourceHandlerRegistry registry) {
        //classpath <-> src/main/resources
        registry.addResourceHandler("/static/user/**").addResourceLocations("classpath:/user/");
        registry.addResourceHandler("/manager/**").addResourceLocations("classpath:/manager/");

        registry.addResourceHandler("/upload/**").addResourceLocations("file:" + UPLOAD_FILE_ROOT);
    }

    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver bean = new InternalResourceViewResolver();
        bean.setViewClass(JstlView.class);
        bean.setPrefix("/views/");
        bean.setSuffix(".jsp");
        return bean;
    }


}
