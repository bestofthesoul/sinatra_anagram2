class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |x|
        x.string :word
        x.timestamps null: false
    end
  end
end
