module UsersHelper

  def true_if_admin
    true if current_user && current_user.role?(:admin) && current_user.id != @user.id
  end
end
