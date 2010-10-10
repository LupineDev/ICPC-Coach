class CreateSubmissions < ActiveRecord::Migration
  def self.up
    create_table :submissions do |t|
      t.boolean :solved
      t.integer :member_id
      t.integer :team_id
      t.integer :problem_id

      t.timestamps 
    end
  end

  def self.down
    drop_table :submissions
  end
end