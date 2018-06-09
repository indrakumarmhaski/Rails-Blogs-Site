class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :description
      t.text :content
      t.string :thumbimg
      t.string :mainimg

      t.timestamps
    end
  end
end
