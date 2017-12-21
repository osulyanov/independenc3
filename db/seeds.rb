User.create!(email: 'em@il.com', password: 'xWHJuYFCRHV7', password_confirmation: 'xWHJuYFCRHV7') unless User.any?
FactoryBot.create_list(:verticals_with_categories, 15)
