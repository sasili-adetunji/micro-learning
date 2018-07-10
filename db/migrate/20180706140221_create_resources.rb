class CreateResources < ActiveRecord::Migration
    create_table :resources do |t|
      t.string :title
      t.string :description
      t.string :url
    end
end
