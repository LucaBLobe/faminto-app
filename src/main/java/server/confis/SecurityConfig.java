package server.confis;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth
			.inMemoryAuthentication()
			.withUser("cozinheiro")
				.password("cozinheiro")
				.roles("COZINHEIRO")
				.and()
			.withUser("entregador")
				.password("entregador")
				.roles("ENTREGADOR")
				.and()
			.withUser("admin")
				.password("admin")
				.roles("COZINHEIRO", "ENTREGADOR", "ADMIN");
		
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.authorizeRequests()
			.antMatchers("/produtos/**").hasRole("ADMIN")
			.antMatchers("/pedido/list").hasAnyRole("ADMIN", "COZINHEIRO", "ENTREGADOR")
			.antMatchers("/**").permitAll()
			.anyRequest().authenticated()
			.and().formLogin()
			.and().csrf().disable();
		
	}
}
