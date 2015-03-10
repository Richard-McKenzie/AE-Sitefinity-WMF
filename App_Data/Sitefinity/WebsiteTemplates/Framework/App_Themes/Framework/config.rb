# Require any additional compass plugins here.
# require 'animation'

http_path = "../"
css_dir = "Global"
sass_dir = "sass"
images_dir = "Images"
javascripts_dir = "JS"

preferred_syntax = :scss

# To disable debugging comments that display the original location of your selectors. Uncomment:
# line_comments = false
output_style = :expanded
# output_style = :compressed

# Make a copy of sprites with a name that has no uniqueness of the hash.
on_sprite_saved do |filename|
  if File.exists?(filename)
    FileUtils.cp filename, filename.gsub(%r{-s[a-z0-9]{10}\.png$}, '.png')
    # Note: Compass outputs both with and without random hash images.
    # To not keep the one with hash, add: (Thanks to RaphaelDDL for this)
    FileUtils.rm_rf(filename)
  end
end
 
# Replace in stylesheets generated references to sprites
# by their counterparts without the hash uniqueness.
on_stylesheet_saved do |filename|
  if File.exists?(filename)
    css = File.read filename
    File.open(filename, 'w+') do |f|
      f << css.gsub(%r{(?<start>-s)(?<hash>[a-z0-9]{10})(?<file>\.png)}, '.png?v=\k<hash>')
    end
  end
end
