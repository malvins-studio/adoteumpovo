# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

Adocao.delete_all

Adotante.delete_all

Pna.delete_all

csv_pnas = CSV.read "db/AllUnreachedByCountryListing.csv", headers:true

pna_id = 1

csv_pnas.each do |p|
   pna = Pna.new
   pna.id = pna_id
   pna.country_code_2 = p["ROG3"]
   pna.country = p["Ctry"]
   pna.people_id3 = p["PeopleID3"]
   pna.peop_name_in_country = p["PeopNameInCountry"]
   pna.people_id1 = p["PeopleID1"]
   pna.affinity_bloc = p["AffinityBloc"]
   pna.people_id2 = p["PeopleID2"]
   pna.people_cluster = p["PeopleCluster"]
   pna.primary_relig_in_people_cluster = p["PrimaryReligionPC"]
   pna.country_code_3 = p["ROL3"]
   pna.primary_language_name = p["PrimaryLanguageName"]
   pna.population = p["Population"]
   pna.in_window_10_40 = p["10_40Window"].eql? "Y"
   # pna.location_in_country = p["LocationInCountry"]
   pna.primary_religion = p["PrimaryReligion"]
   pna.percent_evangelical = p["PercentEvangelical"]
   pna.percent_adherents = p["PercentAdherents"]
   pna.is_least_reached = p["LeastReached"].eql? "Y"
   pna.joshua_project_scale = p["JPScale"]
   pna.bible_status = p["BibleStatus"]
   pna.has_jesus_movie_translated = p["JF"].eql? "Y"
   pna.has_audio_recordings = p["AudioRecordings"].eql? "Y"
   pna.new_testament_online_code = p["NTOnline"]
   pna.is_indigenous = p["IndigenousCode"].eql? "Y"
   pna.latitude = p["Latitude"]
   pna.longitude = p["Longitude"]
   pna.photo_url = "https://joshuaproject.net/assets/media/profiles/photos/#{p["PhotoAddress"]}" unless p["PhotoAddress"].nil?
   pna.map_url = "https://joshuaproject.net/assets/media/profiles/maps/#{p["MapAddress"]}" unless p["MapAddress"].nil?
    #utilizado em alguns casos apenas
   # pna.flag_url = "https://cdn.staticaly.com/gh/hjnilsson/country-flags/master/svg/#{p["ROG3"].downcase}.svg"
   pna.flag_url = "https://www.cia.gov/library/publications/the-world-factbook/attachments/flags/#{p["ROG3"]}-flag.jpg"
   pna.save
   pna_id += 1
end
