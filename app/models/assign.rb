class Assign < ApplicationRecord
  belongs_to :contract
  belongs_to :assignable, polymorphic: true

  validates :assign_count,
            numericality: { greater_than_or_equal_to: 0 },
            allow_blank: true
  validates_uniqueness_of :assignable_id,
                          conditions: -> { where(assignable_type: 'Vehicle') },
                          if: Proc.new { |record| record.assignable_type == 'Vehicle' }
  validates_uniqueness_of :contract_id, scope: [:assignable_id, :assignable_type]

  before_destroy :unassing_item

  def update_assignable_model
    if assignable_type == 'Equipment' && saved_change_to_assign_count? && saved_change_to_assign_count[1].present?
      record = Equipment.find(assignable_id)
      diff_count = saved_change_to_assign_count[0] - saved_change_to_assign_count[1]
      record.update(assigned: (record.assigned - diff_count),
                    available: record.available + diff_count)
    end
  end

  def assigned_item
    assignable_type == 'Equipment' ? update_equipment(true) : update_vehicle(true)
  end

  private

  def unassing_item
    assignable_type == 'Equipment' ? update_equipment(false) : update_vehicle(false)
  end

  def update_equipment(assign = true)
    return if assign_count.nil?
    record = Equipment.find(assignable_id)
    if assign
      taken = record.available - assign_count
      assigned = record.assigned + assign_count
    else
      taken = record.available + assign_count
      assigned = record.assigned - assign_count
    end
    record.update(available: taken,
                  assigned: assigned)
  end

  def update_vehicle(added = true)
    Vehicle.find(assignable_id).update(added: added)
  end
end
