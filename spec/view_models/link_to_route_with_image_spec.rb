require 'spec_helper'

describe LinkToRouteWithImage do


  it "creates the correct html" do
    expect(LinkToRouteWithImage.call('route', 'title', 'img')).to eq("<a class=\"image-link\" href=\"route\"><img src=\"/images/img\" alt=\"Img\" /></a> <a class=\"title\" href=\"route\">title</a>")
  end

end
