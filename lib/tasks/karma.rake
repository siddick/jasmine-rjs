require 'jasmine'

BaseConfigFile = File.expand_path('../karma-config.js', __FILE__)
DefaultConfigFile = 'karma.conf.js'

namespace :jasmine do
  task :run_karma, [:config_file] do |t, args|
    config_file = args[:config_file]
    if config_file
      config_file = File.expand_path(config_file)
    elsif File.exist? DefaultConfigFile
      config_file = File.expand_path(DefaultConfigFile)
    end

    Jasmine::wait_for_listener(Jasmine.config.port(:server), 'jasmine server')

    if config_file
      system("CONFIG_FILE=#{config_file} karma start #{BaseConfigFile}")
    else
      system("karma start #{BaseConfigFile}")
    end
  end

  desc 'run karma & jasmine service'
  multitask(:karma, [:config_file] => [:server, :run_karma])
end
