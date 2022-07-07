require 'rails_helper'

RSpec.describe 'user dashboard' do
    before :each do
        @user1 = User.create!(email: 'jake.taffer@gmail.com', name: 'Jake')
        @party1 = @user1.parties.create!(duration: 160, date: '2014-12-01', time: '01:29:18', host: @user1.name)
    end

    it 'lists the users name at the top of the page' do
        visit user_path(@user1)

        expect(page).to have_content("Jake's Dashboard")
    end 

    it 'has a button to discover movies' do 
        visit user_path(@user1)

        expect(page).to have_button("Discover Movies")

        click_on 'Discover Movies'

        expect(current_path).to eq(user_movies_discover_path(@user1))
    end

    it 'lists all of the viewing parties that this user is apart of' do
       visit user_path(@user1) 

        expect(page).to have_content('Viewing Parties (Host)')

        expect(page).to have_content('Viewing Parties (Guest)')

    end
end