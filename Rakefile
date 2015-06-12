task default: ["test"]

task :test => [:lint, :style, :unit]

desc "Vendor the cookbooks in the Berksfile"
task :berks_prep do
  sh %{chef exec berks vendor}
end

desc "Get the gems installed"
task :bundle do
  sh %(chef exec gem install -g)
end

desc "Run FoodCritic (lint) tests"
task :lint do
  sh %{chef exec foodcritic --epic-fail any --tags ~FC003 --tags ~FC023 .}
end

desc "Run RuboCop (style) tests"
task :style do
  sh %{chef exec rubocop}
end

desc "Run RSpec (unit) tests"
task :unit => [:berks_prep, :bundle] do
  sh %{chef exec rspec --format documentation}
end

desc "Remove the berks-cookbooks directory and the Berksfile.lock"
task :clean do
  rm_rf [
    'berks-cookbooks',
    'Berksfile.lock'
  ]
end

desc "Integration test"
task :integration => [:berks_prep, :bundle] do
  sh %(chef exec kitchen test)
end
