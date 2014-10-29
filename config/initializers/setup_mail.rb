ActionMailer::Base.smtp_settings = {
    :address              => "smtp.yandex.ua",
    :port                 => 587,
    :domain               => "sitemaster.com.ua",
    :user_name            => "master@sitemaster.com.ua",
    :password             => "21091091",
    :authentication       => "plain",
    :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
#ActionMailer::Base.default_url_options[:host] = "http://178.62.228.131"
