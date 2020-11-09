class AddCpfToClients < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :cpf, :string
  end
end
