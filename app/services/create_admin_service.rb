class CreateAdminService
  def call
    user = User.find_or_create_by!(username: Rails.application.secrets.admin_username) do |user|
        user.name = Rails.application.secrets.admin_username
        user.role = :admin
        user.email = Rails.application.secrets.admin_email
        user.password = Rails.application.secrets.admin_password
        user.password_confirmation = Rails.application.secrets.admin_password
      end
  end
end
