class AddHashedUrlToImages < ActiveRecord::Migration
  def change
    add_column :images, :hashed_url, :string
  end
end
