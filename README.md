Episode 12 - Tests 3 Ways (RSpec, MiniTest, Test::Unit)
=====================

TDD two clases, three ways. Compare RSpec, MiniTest, and Test::Unit

Note I added a rakefile that you can run all tests (rspec and MiniTest/TestUnit) by "bundle exec rake"

Panda Level
-----------

1. In the MiniTest folder, write a test asserting that the Admiral does have a battleship
2. In the MiniTest folder, change the ammunition from 100 to 10, and assert that's the starting point for a battleship

Tiger Level
-----------

1. Use the MiniTest Should syntax to confirm that the Battleship can request more ammunition
2. TDD in whichever syntax you like that the Battleship can recevie more ammunition

Eagle Level
-----------

1. When the battleship fires, it should return a hit or a miss
2. Create a separate class "Fate" that will determine if the hit is a miss or a hit
3. Fate should impement a rand() to decide if it was a hit or not
4. You should stub/mock out the Fate call to test what happens if it hits or misses

Show Links
----------

* MiniTest: https://github.com/seattlerb/minitest
* Testing with MiniTest: http://rubylearning.com/blog/2011/07/28/how-do-i-test-my-code-with-minitest/
* MiniTest matchers: https://github.com/zenspider/minitest-matchers

Copyright
---------

Copyright: 2012 Jesse Wolgamott, MIT License (See LICENSE)
