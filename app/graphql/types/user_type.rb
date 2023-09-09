module Types
  class UserType < Types::Base::Object
    field :nickname, String
    field :avatar, AvatarType, null: false
  end
end
