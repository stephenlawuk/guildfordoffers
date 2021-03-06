xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Guildford Student Offers"
    xml.description "The 24 latest offers for students in Guildford!!"
    xml.link posts_url

    for post in @posts
      xml.item do
        xml.title post.offer
        xml.description { xml.cdata!(image_tag(post.imgurl) + post.description)}
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link post_url(post)
        xml.guid post_url(post)
      end
    end
  end
end
