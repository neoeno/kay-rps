RSpec.feature "Game", type: :feature do

  context "Computer chooses Scissors" do
    scenario "User wins the game" do
      sign_up

      allow_any_instance_of(Game).to receive(:result).and_return(:player_win)

      click_button "Rock"
      expect(page).to have_text("You chose Rock, computer chose Scissors, you win!")
    end

    scenario "User loses the game" do
      sign_up

      allow_any_instance_of(Game).to receive(:result).and_return(:computer_win)

      click_button "Paper"
      expect(page).to have_text("You chose Paper, computer chose Scissors, you lose!")
    end

    scenario "User draws the game" do
      sign_up

      allow_any_instance_of(Game).to receive(:result).and_return(:draw)

      click_button "Scissors"
      expect(page).to have_text("You chose Scissors, computer chose Scissors, you draw!")
    end
  end

  context "Computer chooses Rock" do
    scenario "User wins the game" do
      sign_up

      allow_any_instance_of(Game).to receive(:result).and_return(:player_win)

      click_button "Paper"
      expect(page).to have_text("You chose Paper, computer chose Rock, you win!")
    end

    scenario "User loses the game" do
      sign_up

      allow_any_instance_of(Game).to receive(:result).and_return(:computer_win)

      click_button "Scissors"
      expect(page).to have_text("You chose Scissors, computer chose Rock, you lose!")
    end

    scenario "User draws the game" do
      sign_up

      allow_any_instance_of(Game).to receive(:result).and_return(:draw)

      click_button "Rock"
      expect(page).to have_text("You chose Rock, computer chose Rock, you draw!")
    end
  end

  def sign_up
    visit "/"
    fill_in "name", with: "May Lovelace"
    click_button "Play"
  end
end
