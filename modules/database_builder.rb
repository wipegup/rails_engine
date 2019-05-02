module DatabaseBuilder

  def table(name, columns)
    model_string = "rails g model #{name} "

    # binding.pry
    columns = columns.to_s.gsub(':', "").gsub("=>", ":").gsub('{','').gsub('}','').gsub('"','').gsub(',','')
    model_string + columns
  end

  def many_to_many(joins_table, other_tables)
    joins_string = "has_many :#{joins_table}"
    joins_through = ", through: :#{joins_table}"


  end

end
