class User < ActiveRecord::Base
  include BCrypt
  # Remember to create a migration!
  has_many :answers
  has_many :comments
  has_many :votes
  has_many :questions


  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  # validate :password_length

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    @user = User.find_by_username(username)
    if @user
      if @user.password == password
        @user
      end
    else
      nil
    end
  end

  def password_length
    if @raw_password.nil?
      errors.add(:base, "Password must be longer than 3 characters")
    elsif @raw_password.length <= 3
      errors.add(:base, "Password must be longer than 3 characters")
      puts self.errors.full_messages
    else
    end
  end

  def activities
    questions + answers + comments + votes
  end

end
