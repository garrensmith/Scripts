require 'albacore'

task :default => [:msbuild, :zip_bundle, :upload_bundle]

desc "Build source code"
msbuild :msbuild do |msb|
  msb.properties :configuration => :Release
  msb.targets :Clean, :Build
  msb.solution = "lib/spec/support/TestSolution/TestSolution.sln"
end


desc "zip binaries"
zip :zip_bundle do |zip|
     zip.directories_to_zip "path/to/converge", "path/to/any/other/folder"
     zip.additional_files = "webconfig", "otherfile"
     zip.output_file = "source.#{@@svn_revision}.zip"
     zip.output_path = File.dirname(__FILE__)
end

desc "upload the zipped binaries to server"
sftp :upload_bundle => :zip_bundle do |sftp|
  sftp.server = "my server"
  sftp.username = "some user"
  sftp.password = "don't tel! it's a secret!"
  sftp.upload_files "local file" => "remote file", "another local file" =>"anothe remote file location"
end
