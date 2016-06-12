module Admin
  module UsersHelper
    def set_admin(data)
      id = data['id']
      admin = data['admin']
      user = User.find_by id: id
    end
  end
end
