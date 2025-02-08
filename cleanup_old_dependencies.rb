# cleanup_old_dependencies.rb
# This script scans and removes outdated files related to Webpacker, Tailwind, Sprockets, etc.

require 'fileutils'

# Define common files and directories to check
OBSOLETE_FILES = [
  'bin/webpack',
  'bin/webpack-dev-server',
  'config/webpacker.yml',
  'config/webpack/',
  'config/tailwind.config.js',
  'config/postcss.config.js',
  'config/initializers/assets.rb',
  'app/javascript/',
  'public/packs/',
  'node_modules/',
  'yarn.lock',
  'package.json',
  'Gemfile.lock'
]

puts "🔍 Scanning for obsolete files..."
deletable_files = OBSOLETE_FILES.select { |file| File.exist?(file) }

if deletable_files.empty?
  puts "✅ No obsolete files found. You're clean!"
  exit
end

puts "🚨 The following outdated files were found:"
deletable_files.each { |file| puts " - #{file}" }

print "
Do you want to delete these files? (yes/no): "
answer = gets.chomp.downcase

if answer == 'yes'
  deletable_files.each do |file|
    FileUtils.rm_rf(file)
    puts "🗑️  Deleted: #{file}"
  end
  puts "✅ Cleanup complete!"
else
  puts "⚠️ Cleanup aborted. No changes made."
end

