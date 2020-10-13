class RenameSuperheroAttribute < ActiveRecord::Migration[6.0]
  def change
    change_table :superheros do |t|
      t.rename :alias, :full_name
    end
  end
end
