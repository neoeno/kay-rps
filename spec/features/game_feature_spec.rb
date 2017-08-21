RSpec.feature "Game", type: :feature do
  # scenario "User enters their name" do
  #   visit "/"
  #
  #   fill_in "name", with: "May Lovelace"
  #   click_button "Play"
  #
  # expect(page).to have_text("May Lovelace plays the game!")
  # end

  scenario "User wins the game" do
    visit "/"
    fill_in "name", with: "May Lovelace"
    click_button "Play"

    click_button "Rock"
    expect(page).to have_text("You win!")
  end

  scenario "User loses the game" do
    visit "/"
    fill_in "name", with: "May Lovelace"
    click_button "Play"

    click_button "Paper"
    expect(page).to have_text("You lose!")
  end

  scenario "User draws the game" do
    visit "/"
    fill_in "name", with: "May Lovelace"
    click_button "Play"

    click_button "Scissors"
    expect(page).to have_text("You draw!")
  end
end
