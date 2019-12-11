class AddDataPermissions < ActiveRecord::Migration[5.0]
  def change
    [1, 2, 3].each do |id|
      %w(ProjectTask Task WorkZone Contract Setting).each do |subject|
        %w(create read update destroy).each do |action|
          Permission.create(subject_class: subject, action: action, role_id: id, active: true)
        end
      end
    end
    [1, 2, 3].each do |id|
      %w(Contract).each do |subject|
        %w(approved archive pending_team approved_team archive_team).each do |action|
          Permission.create(subject_class: subject, action: action, role_id: id, active: true)
        end
      end
    end
    [1, 2, 3].each do |id|
      %w(User).each do |subject|
        %w(tracker time_tracker ).each do |action|
          Permission.create(subject_class: subject, action: action, role_id: id, active: true)
        end
      end
    end
  end
end
