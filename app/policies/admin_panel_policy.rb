class AdminPanelPolicy < Struct.new(:user, :AdminPanel)

  include BasePolicy

end
