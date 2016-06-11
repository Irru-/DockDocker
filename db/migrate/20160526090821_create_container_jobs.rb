class CreateContainerJobs < ActiveRecord::Migration
  def change
    create_table :container_jobs do |t|

      t.timestamps null: false
    end
  end
end
