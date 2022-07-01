# Ruby program for parsing a config file
# Jake Tobiason 07/01/2022

# Converts hash values into numerics, Booleans or leaves them alone
# if they should be string
def type_converter(value)
    true_values = ["on", "yes", "true"]
    false_values = ["off", "no", "false"]

    if true_values.include? value
        value = true
    elsif false_values.include? value
        value = false
    elsif !value.include? "."
        begin
            Integer(value)
        rescue ArgumentError
            value
        end
    else
        begin
            Float(value)
        rescue ArgumentError
            value
        end
    end
end

# Removes comment lines from array and gets rid of whitespace and newlines
def sanitizer(config_array)
    config_array.each do |item|
    unless item.include? "="
        config_array -= [item]
    else
        item.gsub!(/[\s\n]+/, '')
    end
        end
config_array
end

# Displays chosen value and it's type to terminal
def display_output(config, config_parameter)
    puts "Value of specified key: " + (config["#{config_parameter}"]).to_s
    puts "Data Type of specified key: " + (config["#{config_parameter}"].class).to_s
end

# Requires config file and desired config parameter to be passed to program
if ARGV.length < 2
    puts "Please specify required arguments when running program.\n"
    puts "Example: $ ruby parser.rb config server_load_alarm"
    exit
end

# Read in config file line by line, storing as array
sanitized_config = sanitizer(IO.readlines("#{ARGV[0]}"))

# Each item before equal sign will turn into 'keys'
# Each item after equals sign will turn into 'values', type of value based on conditions
config_hash = Hash[sanitized_config.map {|item| item.split '='}]
# Perform check for if user has passed in a valid key, if not, exit and inform them
unless config_hash.has_key?(ARGV[1])
    puts "Key specified as argument does not exist in hash..."
    exit
end
config_hash.transform_values! {|item| type_converter(item)}

# Call display method
display_output(config_hash, ARGV[1])

