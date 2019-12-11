module PermissionsHelper

  def draw_model_name(model)
    I18n.t model, scope: 'permissions.models'
  end

  def draw_model_description(model)
    I18n.t model, scope: 'permissions.descriptions'
  end

end
