require "bundler/gem_tasks"
require "fileutils"

desc "Update included OpenLayers sources"
task :update_from_source do
  current_directory = File.expand_path File.dirname(__FILE__)
  source_directory  = File.join current_directory, 'openlayers'
  assets_directory  = File.join current_directory, 'vendor', 'assets'

  puts "Updating sources..."

  `git submodule update`

  puts "Trashing the old stuff..."

  FileUtils.rm_r Dir.glob(File.join assets_directory, '*')

  puts "Building the main JS file..."

  build_dir         = File.join source_directory, 'build'
  build_destination = File.join assets_directory, 'javascripts', 'openlayers', 'OpenLayers.js'

  FileUtils.mkdir_p File.dirname build_destination
  `cd #{build_dir} && python ./buildUncompressed.py full #{build_destination}`

  puts "Copying over other files..."

  ["authors.txt", "license.txt"].each do |file|
    FileUtils.cp File.join(source_directory, file), File.join(current_directory, file)
  end

  {
    "img/*" => "images/openlayers/img",
    "theme/default/img/*" => "images/openlayers/theme/default/img",
    "theme/default/*.css" => "stylesheets/openlayers/theme/default"
  }.each do |source, destination|
    source      = File.join source_directory, source
    destination = File.join assets_directory, destination

    FileUtils.mkdir_p destination

    FileUtils.cp_r Dir.glob(source), destination
  end

  puts "Done! Now update version information and release!"
end
