User.destroy_all
Profile.destroy_all
TodoList.destroy_all
TodoItem.destroy_all

def create_user(username, password)
  User.create(username: username, password_digest: password)
end

def create_profile(user, gender, birth_year, first_name, last_name)
  user.profile = Profile.create(gender: gender, birth_year: birth_year, first_name: first_name, last_name: last_name)
end

def create_todolist(user, list_name)
  user.todo_lists << TodoList.create(list_name: list_name, list_due_date: Date.today + 1.year)
end

fiorina = create_user('Fiorina', '12345')
trump = create_user('Trump', '12345')
carson = create_user('Carson', '12345')
clinton = create_user('Clinton', '12345')

create_profile(fiorina, 'female', 1954, 'Carly', 'Fiorina')
create_profile(trump, 'male', 1946, 'Donald', 'Trump')
create_profile(carson, 'male', 1951, 'Ben', 'Carson')
create_profile(clinton, 'female', 1947, 'Hillary', 'Clinton')

create_todolist(fiorina, 'Fiorina to do list')
create_todolist(trump, 'Trump to do list')
create_todolist(carson, 'Carson to do list')
create_todolist(clinton, 'Clinton to do list')

todolists = TodoList.all

todolists.each do |list|
  5.times do
    list.todo_items << TodoItem.create(due_date: Date.today + 1.year, title: 'My title!', description: 'Love is all')
  end
end
