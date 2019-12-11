class AddNewPermToDatabase < ActiveRecord::Migration[5.2]
  def change
    [1, 2, 3].each do |id|
      %w(Properties Toolkit).each do |subject|
        %w(create read update destroy only_for_admins).each do |action|
          Permission.create(subject_class: subject, action: action, role_id: id, active: true)
        end
      end
    end
  end
end
