package lv.whattobuy.app;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.DelegatingFilterProxy;
import org.springframework.web.servlet.DispatcherServlet;

public class AppInitializer implements WebApplicationInitializer {

	public void onStartup(ServletContext servletContext) throws ServletException {
		AnnotationConfigWebApplicationContext context = new AnnotationConfigWebApplicationContext();
		context.setConfigLocation("lv.whattobuy.app");

		servletContext.addListener(new ContextLoaderListener(context));
		
		servletContext.addFilter(
	            "springSecurityFilterChain",
	            new DelegatingFilterProxy("springSecurityFilterChain"))
	        .addMappingForUrlPatterns(null, false, "/*");

		ServletRegistration.Dynamic dispatcher = servletContext.addServlet("DispatcherServlet",
				new DispatcherServlet(context));
		dispatcher.setLoadOnStartup(1);
		dispatcher.addMapping("/");
	}

}