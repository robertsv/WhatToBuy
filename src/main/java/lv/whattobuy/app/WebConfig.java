package lv.whattobuy.app;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.jooq.SQLDialect;
import org.jooq.impl.DataSourceConnectionProvider;
import org.jooq.impl.DefaultConfiguration;
import org.jooq.impl.DefaultDSLContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.TransactionAwareDataSourceProxy;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "lv.whattobuy")
public class WebConfig extends WebMvcConfigurerAdapter {
	
	@Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("/css/").setCachePeriod(31556926);
		registry.addResourceHandler("/images/**").addResourceLocations("/images/").setCachePeriod(31556926);
		registry.addResourceHandler("/js/**").addResourceLocations("/js/").setCachePeriod(31556926);
		registry.addResourceHandler("/fonts/**").addResourceLocations("/fonts/").setCachePeriod(31556926);
	}

	@Bean
	public ViewResolver configureViewResolver() {
		InternalResourceViewResolver viewResolve = new InternalResourceViewResolver();
		viewResolve.setPrefix("/views/");
		viewResolve.setSuffix(".jsp");
		return viewResolve;
	}
	
	@Bean(name="dataSource")
    public DataSource dataSource() {
        BasicDataSource ds = new BasicDataSource();
        ds.setDriverClassName("org.postgresql.Driver");
        ds.setUsername("postgres");
        ds.setPassword("postgres");
        ds.setUrl("jdbc:postgresql://localhost/whattobuy");
        return ds;
    }
	
	@Bean(name="transactionManager")
    public PlatformTransactionManager txManager() {
        return new DataSourceTransactionManager(dataSource());
    }
	
	@Bean(name="transactionAwareDataSource")
    public TransactionAwareDataSourceProxy transactionAwareDataSource() {
        return new TransactionAwareDataSourceProxy(dataSource());
    }
	
	@Bean(name="connectionProvider")
    public DataSourceConnectionProvider connectionProvider() {
        return new DataSourceConnectionProvider(dataSource());
    }
	
	@Bean(name="dsl")
    public DefaultDSLContext dsl() {
        return new DefaultDSLContext(config());
    }
	
	@Bean(name="config")
    public DefaultConfiguration config() {
		DefaultConfiguration defaultConfiguration = new  DefaultConfiguration();
		defaultConfiguration.setConnectionProvider(connectionProvider());
		defaultConfiguration.setSQLDialect(SQLDialect.POSTGRES);
		return defaultConfiguration;
    }
	
}
