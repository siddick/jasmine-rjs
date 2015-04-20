module Jasmine
  module Rjs
    class Railtie < Rails::Railtie
      railtie_name :jasmine_rjs

      rake_tasks do
        load 'tasks/karma.rake'
      end
    end
  end
end
