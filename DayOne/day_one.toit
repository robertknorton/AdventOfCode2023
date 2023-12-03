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

Isaiah 9:6
  For to us a child is born,
      to us a son is given;
  and the government shall be upon[a] his shoulder,
      and his name shall be called[b]
  Wonderful Counselor, Mighty God,
      Everlasting Father, Prince of Peace.
*/

import .input

task-part-one-result-sum /int := 0
task-part-two-result-sum /int := 0

main:
  // Create a task for Part One
  task:: task-part-one
  // Create a task for Part Two
  task:: task-part-two
  // Create a task to output results
  task:: task-results

/*
  _____           _      ____             
 |  __ \         | |    / __ \            
 | |__) |_ _ _ __| |_  | |  | |_ __   ___ 
 |  ___/ _` | '__| __| | |  | | '_ \ / _ \
 | |  | (_| | |  | |_  | |__| | | | |  __/
 |_|   \__,_|_|   \__|  \____/|_| |_|\___|
                                          
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
task-part-one:  
  print "---------PART One---------"
  list-row-strings := List
  list-row-numbers := List
  result-sum /int := 0
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
  task-part-one-result-sum = result-sum

/*
  _____           _     _______            
 |  __ \         | |   |__   __|           
 | |__) |_ _ _ __| |_     | |_      _____  
 |  ___/ _` | '__| __|    | \ \ /\ / / _ \ 
 | |  | (_| | |  | |_     | |\ V  V / (_) |
 |_|   \__,_|_|   \__|    |_| \_/\_/ \___/ 
                                           
                                           
Your calculation isn't quite right. It looks like some of the digits are actually spelled out with letters: one, two, three, four, five, six, seven, eight, and nine also count as valid "digits".

Equipped with this new information, you now need to find the real first and last digit on each line. For example:

two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen
In this example, the calibration values are 29, 83, 13, 24, 42, 14, and 76. Adding these together produces 281.

What is the sum of all of the calibration values?
*/
task-part-two:
  print "---------PART TWO---------"
  list-row-strings := List
  list-row-numbers := List
  result-sum /int := 0
  // Create array of input lines
  input-string.split "\n": list-row-strings.add (it)
  // Loop through rows in array
  count := 0
  list-row-strings.do:
    count += 1
    list-current-numbers := []
    string-processed-line := it
    list-of-numeric-names := [["one","1"], ["two","2"], ["three","3"], ["four","4"], ["five","5"], ["six","6"], ["seven","7"], ["eight","8"], ["nine","9"]]
    list-index-found := []
 
    for index := 0; index < string-processed-line.size; index++:
      value := string-processed-line[index]
      if (value > 47 and value < 58):
        list-index-found.add [index,"$(%c value)"]
    
    print ("Line: " + count.stringify + " List (Digits Only): " + it.stringify) + (" --> " + list-index-found.stringify) 

    for numeric-name := 0; numeric-name < list-of-numeric-names.size; numeric-name++:
      first := string-processed-line.index_of list-of-numeric-names[numeric-name][0]
    //   print ("Line: " + count.stringify + " Numeric name: " + list-of-numeric-names[numeric-name][0].stringify + " First: " + first.stringify)
      last := string-processed-line.index_of --last list-of-numeric-names[numeric-name][0]
    //   print ("Line: " + count.stringify + " Numeric name: " + list-of-numeric-names[numeric-name][0].stringify + " Last: " + last.stringify)
      if first > -1:
        list-index-found.add [first,list-of-numeric-names[numeric-name][1]]
      if first != last and last > -1:
        list-index-found.add [last,list-of-numeric-names[numeric-name][1]]
    // Perform a sort of the index list
    list-index-found.sort --in-place: | a b | a[0] - b[0] 
    print ("Line: " + count.stringify + " List (Digits & Strings): " + it.stringify) + (" --> " + list-index-found.stringify) 
      
    // Extract numerical values from 2D index-value-pair array into a numerical only array
    list-index-found.do: | index-value-pair |
      list-current-numbers.add (index-value-pair[1])
      
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
  task-part-two-result-sum = result-sum

/*
  _____                 _ _       
 |  __ \               | | |      
 | |__) |___  ___ _   _| | |_ ___ 
 |  _  // _ \/ __| | | | | __/ __|
 | | \ \  __/\__ \ |_| | | |_\__ \
 |_|  \_\___||___/\__,_|_|\__|___/
                                  
*/
task-results:
  print "-------------------------------------------------------"
  print "Part One - Final Result: " + "$task-part-one-result-sum"
  print "Part Two - Final Result: " + "$task-part-two-result-sum"
  print "-------------------------------------------------------"