namespace :clean do
  desc "replace all tab to two spaces in .rb file"
  task "replace_tab" => :environment do
    Dir["#{Rails.root}/**/*.rb"].each do |file|
      content = File.read file
      content.gsub!(/\t/, "  ")
      File.open(file, "w+") { |f| f.write(content)}
    end
  end
end