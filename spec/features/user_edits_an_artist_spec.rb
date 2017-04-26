require "rails_helper"

RSpec.feature "user can edit artist" do
  scenario "after clicking edit a user can change artist information" do
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist = Artist.create!(name: "Bob Marley", image_path: artist_image_path)

    visit "/artists/#{artist.id}"


    expect(page).to have_content "Bob Marley"
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
    expect(page).to have_link "Edit"

    click_link "Edit"
    fill_in "artist_name", with: "BOBBY MAY"
    click_on "Update Artist"

    expect(page).to have_content "BOBBY MAY"
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
