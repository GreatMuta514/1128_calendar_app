# frozen_string_literal: true

class AddNicknameColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :nickname, :string
  end
end
