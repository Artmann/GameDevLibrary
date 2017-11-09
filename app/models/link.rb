class Link < ApplicationRecord
  acts_as_taggable

	def icon
		patterns = [
			['youtube', 'youtube'],
			['github', 'github'],
			['medium', 'medium'],
			['twitch', 'twitch'],
		]

		patterns.each do |p|
			return p.last if url.include?(p.first)	
		end

		return nil
	end
end
