require './lib/enigma'

key = ARGV[2]
date = ARGV[3]

handle = File.open(ARGV[0], 'r')
message = handle.read
enigma = Enigma.new(message, key, date)
handle.close
decrypted = enigma.decrypt(message, key, date)[:decryption]
writer = File.open(ARGV[1], 'w')
writer.write(decrypted)
writer.close
puts "Created #{(ARGV[1])} with the key #{key} and date #{date}"
