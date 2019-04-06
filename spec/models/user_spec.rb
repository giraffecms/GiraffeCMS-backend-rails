require 'rails_helper'

RSpec.describe User, type: :model do
	it 'has a valid factory' do
		expect(build(:user)).to be_valid
	end

	describe 'validation' do
		let!(:user) { build(:user) }

		it { should validate_presence_of(:username) }
		it { should validate_presence_of(:email) }
		it { should validate_presence_of(:password) }

		it { should validate_length_of(:username).is_at_least(2) }
		it { should validate_length_of(:email).is_at_most(100) }
		it { should validate_length_of(:password).is_at_least(6) }

		context 'email validation' do
			it 'should accept valid adresses' do
				valid_addresess = %w[email@example.com firstname.lastname@example.com email@subdomain.example.com firstname+lastname@example.com email@123.123.123.123 1234567890@example.com email@example-one.com _______@example.com email@example.name email@example.museum email@example.co.jp firstname-lastname@example.com]

				valid_addresess.each do |adress|
					user.email = adress
					expect(user).to be_valid
				end
			end

			it 'shouldn not accept invalid adresses' do
				invalid_adressess = ['plainaddress' '#@%^%#$@#$@#.com' '@example.com' 'Joe Smith' '<email@example.com>' 'mail.example.com' 'email@example@example.com' '”(),:;<>[\]@example.com' 'just”not”right@example.com']

				invalid_adressess.each do |adress|
					user.email = adress
					expect(user).to be_invalid
				end
			end
		end

		context 'username validation' do
			it 'should accept valid usernames' do
				valid_usernames = ['fqewqf', 'fFAEf231', 'RandyLahey', 'jrock1337', '1234234235']

				valid_usernames.each do |username|
					user.username = username

					expect(user).to be_valid
				end
			end

			it 'should not accept invalid usernames' do
				invalid_usernames = ['!@3', 'ff ff', '...', 'dd@dd.pl', 'wqre2123-23', 'EW213123ed_d']

				invalid_usernames.each do |username|
					user.username = username

					expect(user).to be_invalid
				end
			end
		end
	end
end
