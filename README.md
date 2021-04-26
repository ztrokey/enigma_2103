# Self Assessment

## Functionality

- **3**
- Encrypt and decrypt functions both work and CLI is functional.

## OOP

- **2.5**
- I used a module for methods that generate. Methods mostly have single responsibility.

## Ruby Conventions

- **2.5**
- Code is properly indented, spaced, and lines are not excessivly long. I followed naming conventions. Enumerables are mostly best use. I could use more time to refactor with other enumerables.

## TDD

- **3**
- Every method has a test. Commit history is good. I used branches and pull requests to ensure that my working code was protected. 105 / 105 LOC (100%) covered.

## Overall
- **2.75**
- It works, and I'm proud of that aspect. I'm sure that there are more clever and shorter methods for my if/else statements but my main focus was completion first, then perfection. The effort was there but execution may be missing on some parts. I need to be able to better understand what's being asked.
# enigma_2103
```rb
Enigma class
pry(main)> require 'date'
#=> true

pry(main)> require './lib/enigma'
#=> true

pry(main)> enigma = Enigma.new
#=> #<Enigma:0x00007ff90f24cb78...>

# encrypt a message with a key and date
pry(main)> enigma.encrypt("hello world", "02715", "040895")
#=>
#   {
#     encryption: "keder ohulw",
#     key: "02715",
#     date: "040895"
#   }

# decrypt a message with a key and date
pry(main) > enigma.decrypt("keder ohulw", "02715", "040895")
#=>
#   {
#     decryption: "hello world",
#     key: "02715",
#     date: "040895"
#   }

# encrypt a message with a key (uses today's date)
pry(main)> encrypted = enigma.encrypt("hello world", "02715")
#=> # encryption hash here

#decrypt a message with a key (uses today's date)
pry(main) > enigma.decrypt(encrypted[:encryption], "02715")
#=> # decryption hash here

# encrypt a message (generates random key and uses today's date)
pry(main)> enigma.encrypt("hello world")
#=> # encryption hash here
```