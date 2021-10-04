require 'rails_helper'

describe 'visitor log in' do
    context 'as property owner' do
        it 'successfully' do
            PropertyOwner.create!({email: 'santanacaiio@gmail.com', password: '123456'})

            visit root_path
            click_on 'Login'
            fill_in 'E-mail', with: 'santanacaiio@gmail.com'
            fill_in 'Senha', with: '123456'
            click_on 'Entrar'

            expect(page).to have_content('Login efetuado com sucesso!')
            expect(page).to have_content('santanacaiio@gmail.com')
            expect(page).to have_link('Logout')
            expect(page).to have_link('Cadastrar Imóvel')
            expect(page).not_to have_link('Entrar')
        end

        it 'and lougs out' do
            property_owner = PropertyOwner.create!({email: 'santanacaiio@gmail.com', password: '123456'})

            login_as property_owner, scope: :property_owner
            visit root_path
            click_on 'Logout'

            expect(page).to have_content('Saiu com sucesso')
            expect(page).to_not have_link('Logout')
            expect(page).to_not have_link(property_owner.email)
            expect(page).to have_link('Login')
            expect(page).to_not have_link('Cadastrar Imóvel')
        end

        it 'create an account' do
            visit root_path
            click_on 'Registre-se'
            fill_in 'E-mail', with: 'santanacaiio@gmail.com'
            fill_in 'Senha', with: '123456'
            fill_in 'Confirme a sua senha', with: '123456'
            click_on 'Criar conta'

            expect(page).to have_content('Login efetuado com sucesso.')
            expect(page).to have_content('santanacaiio@gmail.com')
            expect(page).to have_content('Cadastrar Imóvel')
            expect(page).to have_content('Logout')
            expect(page).to_not have_link('Login')
        end
    end
end
