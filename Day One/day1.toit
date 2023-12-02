/*
███████████████████████████████████████████████████████████████████████████████████████████████████
██▀▄─██▄─▄▄▀█▄─█─▄█▄─▄▄─█▄─▀█▄─▄█─▄─▄─███─▄▄─█▄─▄▄─███─▄▄▄─█─▄▄─█▄─▄▄▀█▄─▄▄─███▀▄▄▀█─▄▄─█▀▄▄▀█▄▄▄░█
██─▀─███─██─██▄▀▄███─▄█▀██─█▄▀─████─█████─██─██─▄█████─███▀█─██─██─██─██─▄█▀████▀▄██─██─██▀▄███▄▄░█
▀▄▄▀▄▄▀▄▄▄▄▀▀▀▀▄▀▀▀▄▄▄▄▄▀▄▄▄▀▀▄▄▀▀▄▄▄▀▀▀▀▄▄▄▄▀▄▄▄▀▀▀▀▀▄▄▄▄▄▀▄▄▄▄▀▄▄▄▄▀▀▄▄▄▄▄▀▀▀▄▄▄▄▀▄▄▄▄▀▄▄▄▄▀▄▄▄▄▀
  _____                __       _______       _                _          _  ___  _ 
 |  __ \              /_ |  _  |__   __|     | |              | |        | ||__ \| |
 | |  | | __ _ _   _   | | (_)    | |_ __ ___| |__  _   _  ___| |__   ___| |_  ) | |
 | |  | |/ _` | | | |  | |        | | '__/ _ \ '_ \| | | |/ __| '_ \ / _ \ __|/ /| |
 | |__| | (_| | |_| |  | |  _     | | | |  __/ |_) | |_| | (__| | | |  __/ |_|_| |_|
 |_____/ \__,_|\__, |  |_| (_)    |_|_|  \___|_.__/ \__,_|\___|_| |_|\___|\__(_) (_)
                __/ |                                                               
               |___/                                                                

Something is wrong with global snow production, and you've been selected to take a look. The Elves have even given you a map; on it, they've used stars to mark the top fifty locations that are likely to be having problems.

You've been doing this long enough to know that to restore snow operations, you need to check all fifty stars by December 25th.

Collect stars by solving puzzles. Two puzzles will be made available on each day in the Advent calendar; the second puzzle is unlocked when you complete the first. Each puzzle grants one star. Good luck!

You try to ask why they can't just use a weather machine ("not powerful enough") and where they're even sending you ("the sky") and why your map looks mostly blank ("you sure ask a lot of questions") and hang on did you just say the sky ("of course, where do you think snow comes from") when you realize that the Elves are already loading you into a trebuchet ("please hold still, we need to strap you in").

As they're making the final adjustments, they discover that their calibration document (your puzzle input) has been amended by a very young Elf who was apparently just excited to show off her art skills. Consequently, the Elves are having trouble reading the values on the document.

The newly-improved calibration document consists of lines of text; each line originally contained a specific calibration value that the Elves now need to recover. On each line, the calibration value can be found by combining the first digit and the last digit (in that order) to form a single two-digit number.

For example:

1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet
In this example, the calibration values of these four lines are 12, 38, 15, and 77. Adding these together produces 142.

Consider your entire calibration document. What is the sum of all of the calibration values?
*/

import .input

list-row-strings := List
list-row-numbers := List
result-sum /int := 0

main:

  // Create a task for Part One
  task:: task-part-one

  // Create a task for Part Two
  task:: task-part-two

task-part-one:  
  // Create array of input lines
  input-string.split "\n": list-row-strings.add (it)
  // Loop through rows in array
  count := 0
  list-row-strings.do:
    count += 1
    list-current-numbers := []
    // Extract numerical values from 1D input array into a numerical only array
    it.do:
      if (it > 47 and it < 58):
        list-current-numbers.add ("$(%c it)")
    
    // If array is of size 1.
    if list-current-numbers.size == 1:
      print ("Line: " + count.stringify + " List: " + list-current-numbers.stringify) + (" --> " + list-current-numbers.first)
      first-num := list-current-numbers.first
      new-num-list := [first-num, first-num]
      string-new-num := new-num-list.join ""
      print ("Line: " + count.stringify + " List: " + new-num-list.stringify) + (" --> " + string-new-num)
      result-sum += int.parse string-new-num
    
    // If array is of size greater than or equal to 2.
    else if list-current-numbers.size > 1:
      first-num := list-current-numbers.first
      last-num := list-current-numbers.last
      new-num-list := [first-num, last-num]
      string-new-num := new-num-list.join ""
      print ("Line: " + count.stringify + " List: " + new-num-list.stringify) + (" --> " + string-new-num)
      result-sum += int.parse string-new-num
    
    else: // Array size is less than 1.
      print "List of < 1. Do nothing."
    print ("Line: " + count.stringify + " Result: " + "$result-sum")
    
  print "Part One - Final Result: " + "$result-sum"

task-part-two:
  // Create array of input lines
  input-string.split "\n": list-row-strings.add (it)
  // Loop through rows in array
  count := 0
  list-row-strings.do:
    count += 1
    list-current-numbers := []
    // Extract numerical values from 1D input array into a numerical only array
    it.do:
      if (it > 47 and it < 58):
        list-current-numbers.add ("$(%c it)")
    /*
    // If array is of size 1.
    if list-current-numbers.size == 1:
      print ("Line: " + count.stringify + " List: " + list-current-numbers.stringify) + (" --> " + list-current-numbers.first)
      first-num := list-current-numbers.first
      new-num-list := [first-num, first-num]
      string-new-num := new-num-list.join ""
      print ("Line: " + count.stringify + " List: " + new-num-list.stringify) + (" --> " + string-new-num)
      result-sum += int.parse string-new-num
    
    // If array is of size greater than or equal to 2.
    else if list-current-numbers.size > 1:
      first-num := list-current-numbers.first
      last-num := list-current-numbers.last
      new-num-list := [first-num, last-num]
      string-new-num := new-num-list.join ""
      print ("Line: " + count.stringify + " List: " + new-num-list.stringify) + (" --> " + string-new-num)
      result-sum += int.parse string-new-num
    
    else: // Array size is less than 1.
      print "List of < 1. Do nothing."
    print ("Line: " + count.stringify + " Result: " + "$result-sum")
    
  print "Part Two - Final Result: " + "$result-sum"
  */