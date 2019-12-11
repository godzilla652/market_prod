class AddNewDataPermissions < ActiveRecord::Migration[5.0]
  def change
    [1, 2, 3].each do |id|
      %w(Permission).each do |subject|
        %w(create read update destroy).each do |action|
          Permission.create(subject_class: subject, action: action, role_id: id, active: true)
        end
      end
    end
  end
end
