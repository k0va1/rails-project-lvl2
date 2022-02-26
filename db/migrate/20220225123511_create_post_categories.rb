# frozen_string_literal: true

class CreatePostCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :post_categories do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
