package com.ajo.cah;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ImportResource;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;


@SpringBootApplication
@ImportResource("classpath:Beans.xml")
public class MainApp extends SpringBootServletInitializer{
	
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(MainApp.class);
    }
	
    public static void main(String[] args) {
      
        SpringApplication.run(MainApp.class, args);
    }
    
    @Bean
    public ViewResolver getViewResolver() {
      System.out.println("Getting view resolvers");
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/jsp/");
        resolver.setSuffix(".jsp");
        return resolver;
    }

    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
      
        configurer.enable();
    } 
    
    
}