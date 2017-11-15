class Video
	require "json"
	require "net/http"
	def get_title
		view_count = 0
		video_detail = []
		url = "https://jon.endpoint.com/youtube-popular-20121222.json"
		resp = Net::HTTP.get_response(URI.parse(url))
		data = JSON.parse(resp.body)
		(data['feed']['entry']).each do |video|
			if video['yt$statistics']['viewCount'].to_i > view_count
				view_count = video['yt$statistics']['viewCount'].to_i
				video_detail = video
			end
		end
		puts video_detail['title'].values 
  end
end

a = Video.new
a.get_title