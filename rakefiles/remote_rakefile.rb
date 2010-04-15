require 'albacore'

:default => [:backup_old, :stop_iis, :install, :gac_install, :start_iis]

desc "zip current binaries as backup"
zip :backup_old do |zip|
     zip.directories_to_zip "path/to/converge", "path/to/any/other/folder"
     zip.additional_files = "webconfig", "otherfile"
     zip.output_file = "website.backup.#{Time.now}.zip"
     zip.output_path = File.dirname(__FILE__)
end

desc "stop iis"
task :stop_iis do
  iis-reset /?"
end

desc "start iis"
task :start_iis do
  sh "iis-reset /?"
end

desc "copy new files into location"
task :install do
end

unzip :install do |unzip|
  unzip.unzip_path = "location/of/folder"
  unzip.zip_file = "Archive.zip"
end