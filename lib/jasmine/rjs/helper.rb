require 'jasmine'

module Jasmine
  class Configuration
    def js_files
      map(@jasmine_files, :jasmine) +
        map(@boot_files, :boot) +
        map(@runner_boot_files, :runner_boot) +
        map(@src_files, :src)
    end

    def spec_files
        map(@spec_files, :spec).map do |file|
          file.sub(/\.js/, '')
        end
    end
  end
end

module Jasmine
  def self.runner_template
    File.read(File.join(File.dirname(__FILE__), "run.html.erb"))
  end
end
