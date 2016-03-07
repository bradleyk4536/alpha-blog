class AddUserIdToArticles < ActiveRecord::Migration
  def change

		#Add a column to a table - table name, then column name and then type

		add_column :articles, :user_id, :integer
  end

end
