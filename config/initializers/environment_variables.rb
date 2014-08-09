# module EnvironmentVariablesExample
#   class Application < Rails::Application
#     config.before_configuration do
#       env_file = Rails.root.join("config", "mandrill.yml").to_s

#       if File.exists?(env_file)
       
#         YAML.load_file(env_file).each do |key, value|
#           ENV[key.to_s] = value
#            binding.pry
#         end # end YAML.load_file
#       end # end if File.exists?
#     end # end config.before_configuration
#   end # end class
# end # end module

module EnvironmentVariablesExample
  class Application < Rails::Application

config.before_configuration do
  env_file = File.join(Rails.root, 'config', 'mandrill.yml')
  YAML.load(File.open(env_file)).each do |key, value|
    ENV[key.to_s] = value
  end if File.exists?(env_file)
end

end
end