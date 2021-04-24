require './lib/enigma'


handle = File.open(ARGV[0], 'r')
message = handle.read
enigma = Enigma.new(message)
handle.close
encrypted = enigma.encryptor
writer = File.open(ARGV[1], 'w')
writer.write(encrypted)
writer.close
puts "Created #{(ARGV[1])} with the key #{enigma.key} and date #{enigma.date}"

