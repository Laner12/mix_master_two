require "rails_helper"

RSpec.feature "user delete an artist" do
  scenario "after clicking delete the artist is deleted" do
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist = Artist.create!(name: "Bob Marley", image_path: artist_image_path)

    visit "/artists/#{artist.id}"


    expect(page).to have_content "Bob Marley"
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
    expect(page).to have_link "Edit"
    expect(page).to have_link "Delete"

    click_link "Delete"

    expect(page).to_not have_content "Bob Marley"
    expect(page).to_not have_css("img[src=\"#{artist.image_path}\"]")
  end
end
