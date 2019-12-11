class DestroyTaskImagesAndAddNewAtachments < ActiveRecord::Migration[5.0]
  def change
    drop_table :task_images
    change_table :tasks do |t|
      t.attachment :photo1
      t.attachment :photo2
      t.attachment :photo3
      t.attachment :photo4
      t.attachment :photo5
      t.attachment :photo6
      t.attachment :photo7
    end
  end
end
