require 'jasmine'

BaseConfigFile = File.expand_path('../karma-config.js', __FILE__)
DefaultConfigFile = 'karma.conf.js'

namespace :jasmine do
  task :run_karma, [:config_file] do |t, args|
    config_file =
      if args[:config_file]
        args[:config_file]
      elsif File.exist? DefaultConfigFile
        DefaultConfigFile
      end

    Jasmine::wait_for_listener(Jasmine.config.port(:server), 'jasmine server')

    ENV["JASMINE_PORT"] = Jasmine.config.port(:server).to_s
    ENV["CONFIG_FILE"] = File.expand_path(config_file) if config_file

    system("karma start #{BaseConfigFile}")
  end

  desc 'run karma & jasmine service'
  multitask(:karma, [:config_file] => [:server, :run_karma])
end
