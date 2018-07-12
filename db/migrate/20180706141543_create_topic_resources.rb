class CreateTopicResources < ActiveRecord::Migration[5.2]
  def change
    create_table :topic_resources do |t|
      t.integer :topic_id
      t.integer :resource_id
    end
  end
end