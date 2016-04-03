# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_user(username, password)
  User.create(username: username, password_digest: password)
end

def create_profile(user, gender, birth_year, first_name, last_name)
  user.profile = Profile.create(gender: gender, birth_year: birth_year, first_name: first_name, last_name: last_name)
end



fiorina = create_user('Fiorina', '12345')
trump = create_user('Trump', '12345')
carson = create_user('Carson', '12345')
clinton = create_user('Clinton', '12345')

create_profile(fiorina, 'female', 1954, 'Carly', 'Fiorina')
create_profile(trump, 'male', 1946, 'Donald', 'Trump')
create_profile(carson, 'male', 1951, 'Ben', 'Carson')
create_profile(clinton, 'female', 1947, 'Hillary', 'Clinton')
