Sequel.migration do
  up do
    create_table :urls do
      primary_key :id
      String :original_url
      String :shortened
    end
  end

  down do
    drop_table :urls
  end
end
