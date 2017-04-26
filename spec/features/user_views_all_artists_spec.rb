require "rails_helper"

RSpec.feature "user can view all artists" do
  scenario "all artists are shown on the index" do
    image = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist = Artist.create!(name: "Bob Marley", image_path: image)
    artist_2 = Artist.create!(name: "Bobby May", image_path: image)

    visit artists_path

    expect(page).to have_content artist.name
    expect(page).to have_content artist_2.name
    expect(page).to have_link artist.name
    expect(page).to have_link artist_2.name
  end
end
