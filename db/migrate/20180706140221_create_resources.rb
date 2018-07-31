# Create migrations for resources
class CreateResources < ActiveRecord::Migration[5.2]
  create_table :resources do |t|
    t.string :title
    t.string :description
    t.string :url
    t.timestamps
  end
end
