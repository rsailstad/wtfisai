class AddAdminUser < ActiveRecord::Migration[7.1]
  def up
    User.create!(
      email: 'admin@example.com',
      password: 'password123',
      password_confirmation: 'password123',
      name: 'Admin User',
      admin: true
    )
  end

  def down
    User.find_by(email: 'admin@example.com')&.destroy
  end
end 