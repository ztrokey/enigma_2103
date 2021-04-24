require './lib/enigma'

handle = File.open(ARGV[0], 'r')
message = handle.read
handle.close
encrypted = message.upcase #try: .encryptor
writer = File.open(ARGV[1], 'w')
writer.write(encrypted)
writer.close