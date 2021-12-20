class ChangeNotNullToBoards < ActiveRecord::Migration[6.1]
  def change
    change_column_null :boards, :point, false
    change_column_null :boards, :wave_size, false
  end
end
