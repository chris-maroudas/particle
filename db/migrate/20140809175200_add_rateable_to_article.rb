class AddRateableToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :rateable, :boolean, default: false
  end
end
