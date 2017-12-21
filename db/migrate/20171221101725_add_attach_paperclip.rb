class AddAttachPaperclip < ActiveRecord::Migration[5.1]
  def self.up
    add_column :results, :attach_file_name,    :string
    add_column :results, :attach_content_type, :string
    add_column :results, :attach_file_size,    :integer
    add_column :results, :attach_updated_at,   :datetime
  end

  def self.down
    remove_column :results, :attach_file_name
    remove_column :results, :attach_content_type
    remove_column :results, :attach_file_size
    remove_column :results, :attach_updated_at
  end
end
