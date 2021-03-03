class AddCostToTimeEntries < PLUGIN_MIGRATION_CLASS
  def change
    add_column :time_entries, :cost, :decimal, precision: 15, scale:  2 unless column_exists? :time_entries, :cost
  end
end
