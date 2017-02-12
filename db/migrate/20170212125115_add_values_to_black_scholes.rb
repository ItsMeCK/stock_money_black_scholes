class AddValuesToBlackScholes < ActiveRecord::Migration
  def change
  	add_column :black_scholes, :c, :decimal, precision: 10, scale: 2
  	add_column :black_scholes, :p, :decimal, precision: 10, scale: 2
  	add_column :black_scholes, :d1, :decimal, precision: 10, scale: 2
  	add_column :black_scholes, :d2, :decimal, precision: 10, scale: 2
  end
end
