Dir[File.join("lib/**/*.rb")].each do |f|
  require File.absolute_path(f)
end
