class AddImageToBoards < ActiveRecord::Migration[6.1]
  def change
    add_column :boards, :image, :string
  end
end
