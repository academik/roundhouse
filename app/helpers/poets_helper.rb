module PoetsHelper

	def social_links(poet)
		social_icons = ''
		social_icons += raw("<a href='http://www.facebook.com/#{poet.facebook}'><img src='/assets/social_media/facebook.png' height='32' width='32'></a>") 	unless poet.facebook == nil || poet.facebook == ''
		social_icons += raw("<a href='http://www.twitter.com/#{poet.twitter}'><img src='/assets/social_media/twitter.png'  height='32' width='32'></a>") 		unless poet.twitter == nil 	|| poet.twitter == ''
	 	social_icons += raw("<a href='http://#{poet.tumblr}.tumblr.com/'><img src='/assets/social_media/tumblr.png'   height='32' width='32'></a>")				unless poet.tumblr == nil 	|| poet.tumblr == ''
		social_icons += raw("<a href='http://www.youtube.com/#{poet.youtube}'><img src='/assets/social_media/youtube.png'  height='32' width='32'></a>")	 	unless poet.youtube == nil 	|| poet.youtube == ''
		return social_icons.html_safe
		# build a string with the HTML in it as you process each variable. 
	end

	def facebook_logo(account)
		if !account.nil? 
			 link_to raw("<img src='/assets/social_media/facebook.png' height='32' width='32'>"), 
			 	"http://www.facebook.com/"+account  
		else
			return #gray Facebook logo
		end
	end

	def twitter_logo(account)
		if !account.nil? 
			 link_to raw("<img src='/assets/social_media/twitter.png' height='32' width='32'>"), 
			 	"http://www.twitter.com/"+account  
		else
			return #gray Facebook logo
		end
	end

	def tumblr_logo(account)
		if !account.nil? 
			link_to raw("<img src='/assets/social_media/tumblr.png' height='32' width='32'>"), 
			 	"http://"+account+".tumblr.com/"
		else
			return #gray Facebook logo
		end
	end

	def youtube_logo(account)
		if !account.nil? 
			link_to raw("<img src='/assets/social_media/youtube.png' height='32' width='32'>"), 
			 	"http://www.youtube.com/"+account  
		else
			return 
		end
	end

end
