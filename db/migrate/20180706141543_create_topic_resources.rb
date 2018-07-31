# Create migrations for topics resources
class CreateTopicResources < ActiveRecord::Migration[5.2]
  def change
    create_table :topic_resources do |t|
      t.integer :topic_id
      t.integer :resource_id
      t.timestamps
    end
  end
end
