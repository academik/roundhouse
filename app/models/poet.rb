class Poet < ActiveRecord::Base
	has_many :poems

	before_save :strip_url_tags

	def strip_url_tags
		self.facebook 	= self.facebook.split("/").last if self.facebook
		self.twitter 	= self.twitter.split("/").last if self.twitter
		self.youtube 	= self.youtube.split("/").last if self.youtube
		if self.tumblr
			self.tumblr 	= self.tumblr.sub(/^https?\:\/\//, '')
			self.tumblr		= self.tumblr.split(".").first 
		end
	end
end
