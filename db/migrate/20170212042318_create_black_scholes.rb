class CreateBlackScholes < ActiveRecord::Migration
  def change
    create_table :black_scholes do |t|
      t.decimal :stock_price, precision: 10, scale: 2
      t.decimal :strike_price, precision: 10, scale: 2
      t.decimal :interest_rate, precision: 4, scale: 2
      t.decimal :time, precision: 4, scale: 2
      t.decimal :volatility, precision: 5, scale: 2
      t.string :call_put_flag

      t.timestamps null: false
    end
  end
end
