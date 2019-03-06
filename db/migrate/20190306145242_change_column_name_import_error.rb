# frozen_string_literal: true

class ChangeColumnNameImportError < ActiveRecord::Migration[5.2]
  def change
    rename_column :import_errors, :error_name, :error_entries
  end
end
