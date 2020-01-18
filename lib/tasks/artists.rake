namespace :artists do
  desc "Load Artists data from yaml file"
  task load_data: :environment do
    require 'active_record/fixtures'
    path = "#{Rails.root}/lib/tasks/artists.yml"
    YAML.load_file(path).with_indifferent_access[:artists].each do |artist|
      Artist.create(name: artist)
    end
  end
end
