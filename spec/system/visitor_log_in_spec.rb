require 'rails_helper'

describe 'visitor log in' do
    it 'successfully' do
        User.create({email: 'santanacaiio@gmail.com', password: '12345'})

        visit root_path
        click_on 'Entrar'
        fill_in 'Email', with: 'santanacaiio@gmail.com'
        fill_in 'Senha', with: '12345'
        click_on 'Entrar'

        expect(page).to have_content('Locou com sucesso')
        expect(page).to have_content('santanacaiio@gmail.com')
        expect(page).to have_link('Logout')
        expect(page).not_to have_link('Entrar')
    end
end
