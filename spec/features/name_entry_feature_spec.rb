RSpec.feature "Name entry", type: :feature do
  scenario "User enters their name" do
    visit "/"

    fill_in "name", with: "May Lovelace"
    click_button "Play"

    expect(page).to have_text("May Lovelace plays the game!")
  end
end
