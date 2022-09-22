class CreateAddNewColumnToArticles < ActiveRecord::Migration[7.0]
  def change

    add_reference :articles, :user, index: false
  end
end
