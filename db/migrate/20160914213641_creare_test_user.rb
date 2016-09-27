class CreareTestUser < ActiveRecord::Migration
  def change
    user = User.new(:email => 'medika@test.com', :password => '123Test123', :confirmed_at => Time.now)
    if user.save
      Institution.create(:director_rm => user.rm_number, :verification_number => '12345')
    end
  end
end
