class RemoveMachineIdFromSnacks < ActiveRecord::Migration[5.1]
  def change
    remove_column :snacks, :machine_id, :bigint
  end
end
