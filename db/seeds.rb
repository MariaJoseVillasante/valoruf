# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv' # requiere la clases

#cargando datos para prueba
Unit.delete_all 
YEAR = "2022" #Constante que no cambia
MONTHS = {
    "Ene": "01",
    "Feb": "02",
}
CSV.foreach("#{Rails.root}/db/UF2022.csv", headers: true, col_sep: ";") do |row|
    hash = row.to_h 
    day = hash[hash.keys.first]
    months = hash.keys[1..2] #meses 1 y 2

    months.each do |m|
        month = MONTHS[m.to_sym]
        period = "#{YEAR}-#{month}-#{day}"
        value = hash[m]
        value.gsub!(".", "").gsub!(",", ".") unless value.nil?
        Unit.create(period: period, value: value)
    end
#Unit.create(period: "2022-01-01", value: 33.000)
end