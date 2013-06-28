Kuangkuang::Application.config.log_level = :warn
Kuangkuang::Application.config.log_tags = [
	lambda { |req| Time.now }, 
	lambda{|req| "#{req.cookie_jar["_kuangkuang_session"]}"[0..31]}]