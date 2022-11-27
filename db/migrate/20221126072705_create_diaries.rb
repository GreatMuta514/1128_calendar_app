# frozen_string_literal: true

class CreateDiaries < ActiveRecord::Migration[6.1]
  def change
    create_table :diaries do |t|
      t.references :user, foreign_key: true
      t.integer :good_or_bad
      t.string :review_the_day
      t.string :for_me_tommorrow
      # 以下のようにすることで、カレンダーに出力できる
      t.datetime :start_time

      t.timestamps
    end
  end
end
