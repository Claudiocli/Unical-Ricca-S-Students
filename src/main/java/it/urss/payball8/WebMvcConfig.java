package it.urss.payball8;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;


@Configuration
@EnableWebMvc
@EnableJpaRepositories
public class WebMvcConfig extends WebMvcConfigurerAdapter  {
 
	@Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addRedirectViewController("home", "forward:/Home");
    }

}
