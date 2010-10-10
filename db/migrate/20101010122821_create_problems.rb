class CreateProblems < ActiveRecord::Migration
  def self.up
    create_table :problems do |t|
      t.string :name
      t.text :description
      t.integer :problem_set_id

      t.timestamps 
    end
  end

  def self.down
    drop_table :problems
  end
end