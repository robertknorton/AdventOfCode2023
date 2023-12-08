/*
███████████████████████████████████████████████████████████████████████████████████████████████████
██▀▄─██▄─▄▄▀█▄─█─▄█▄─▄▄─█▄─▀█▄─▄█─▄─▄─███─▄▄─█▄─▄▄─███─▄▄▄─█─▄▄─█▄─▄▄▀█▄─▄▄─███▀▄▄▀█─▄▄─█▀▄▄▀█▄▄▄░█
██─▀─███─██─██▄▀▄███─▄█▀██─█▄▀─████─█████─██─██─▄█████─███▀█─██─██─██─██─▄█▀████▀▄██─██─██▀▄███▄▄░█
▀▄▄▀▄▄▀▄▄▄▄▀▀▀▀▄▀▀▀▄▄▄▄▄▀▄▄▄▀▀▄▄▀▀▄▄▄▀▀▀▀▄▄▄▄▀▄▄▄▀▀▀▀▀▄▄▄▄▄▀▄▄▄▄▀▄▄▄▄▀▀▄▄▄▄▄▀▀▀▄▄▄▄▀▄▄▄▄▀▄▄▄▄▀▄▄▄▄▀
  _____                ____       _____                   _____       _   _           
 |  __ \              |___ \ _   / ____|                 |  __ \     | | (_)          
 | |  | | __ _ _   _    __) (_) | |  __  ___  __ _ _ __  | |__) |__ _| |_ _  ___  ___ 
 | |  | |/ _` | | | |  |__ <    | | |_ |/ _ \/ _` | '__| |  _  // _` | __| |/ _ \/ __|
 | |__| | (_| | |_| |  ___) |_  | |__| |  __/ (_| | |    | | \ \ (_| | |_| | (_) \__ \
 |_____/ \__,_|\__, | |____/(_)  \_____|\___|\__,_|_|    |_|  \_\__,_|\__|_|\___/|___/
                __/ |                                                                 
               |___/                                                                                                                             
Luke 1:26-28
  In the sixth month the angel Gabriel was sent from God to a city of Galilee named Nazareth, 
  to a virgin betrothed[a] to a man whose name was Joseph, of the house of David. 
  And the virgin's name was Mary. And he came to her and said, 
  “Greetings, O favored one, the Lord is with you!”
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
                                          
You and the Elf eventually reach a gondola lift station; he says the gondola lift will take you up to the water source, but this is as far as he can bring you. You go inside.

It doesn't take long to find the gondolas, but there seems to be a problem: they're not moving.

"Aaah!"

You turn around to see a slightly-greasy Elf with a wrench and a look of surprise. "Sorry, I wasn't expecting anyone! The gondola lift isn't working right now; it'll still be a while before I can fix it." You offer to help.

The engineer explains that an engine part seems to be missing from the engine, but nobody can figure out which one. If you can add up all the part numbers in the engine schematic, it should be easy to work out which part is missing.

The engine schematic (your puzzle input) consists of a visual representation of the engine. There are lots of numbers and symbols you don't really understand, but apparently any number adjacent to a symbol, even diagonally, is a "part number" and should be included in your sum. (Periods (.) do not count as a symbol.)

Here is an example engine schematic:

467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..
In this schematic, two numbers are not part numbers because they are not adjacent to a symbol: 114 (top right) and 58 (middle right). Every other number is adjacent to a symbol and so is a part number; their sum is 4361.

Of course, the actual engine schematic is much larger. What is the sum of all of the part numbers in the engine schematic?                 
*/

class PartNumber:
  line /int? := null
  index /int? := null
  length /int? := null
  value /string? := null
  is-valid := "unknown"

  stringify -> string:
    return "\nLine: $line, Index: $index, Length: $length, Value: $value, is-valid: $is-valid"
  constructor .line .index .length .value:
    

numbers := [0,1,2,3,4,5,6,7,8,9]
symbols := ["@","#","%","&","*","-","=","+","/"]
list-of-part-numbers := []

task-part-one:  
  print "---------PART One---------"
  list-of-schematic-lines := []
  input-string.split "\n": | line |
    list-of-schematic-lines.add (line)
  //print list-of-schematic-lines

  // Iterate Lines in schematic
  for line := 0; line < list-of-schematic-lines.size; line++:
    str-line := list-of-schematic-lines[line]
    last-cursor-was-number := false
    // Iterate characters in each line
    for cursor := 0; cursor < str-line.size; cursor++:
      // init string character from its unicode code point
      str-char := "$(%c str-line[cursor])"
      is-number := false
      // Determine if this current character is infact a number
      numbers.size.repeat: | number |
        if number.stringify == str-char:
          is-number = true
      // If it is a number we want to do stuff ;)
      if is-number:
        // Was this the last cursor location an number also? If so, append this number to that number.
        if last-cursor-was-number == true:
          last-pn := list-of-part-numbers.last
          last-pn.value = ([last-pn.value, str-char].join "")
          last-pn.length = last-pn.value.size
        //   print last-pn.stringify
        else: // Otherwise lets make a new number
          new-pn := PartNumber line cursor str-char.size str-char
          list-of-part-numbers.add new-pn
          last-cursor-was-number = true
      else: // Not a number so clear cursor memory
        last-cursor-was-number = false

  // Now we need to check around the numbers for symbols
  list-of-part-numbers.do: | part-number |
    // print part-number.stringify
    surrounding-characters := []
    // Handle left char
    exception := catch:
      left-char := list-of-schematic-lines[part-number.line][part-number.index - 1]
      surrounding-characters.add "$(%c left-char)"
    if exception:
      print "Left char not found"
    // Handle right char
    exception = catch:
      right-char := list-of-schematic-lines[part-number.line][part-number.index + part-number.length]
      surrounding-characters.add "$(%c right-char)"
    if exception:
      print "Right char not found"
    
    // Handle chars above
    for index := -1; index < (part-number.length + 1); index++:
      exception = catch:
        above-char := list-of-schematic-lines[part-number.line - 1][part-number.index + index]
        surrounding-characters.add "$(%c above-char)"
      if exception:
        print "Above char not found"
    
    // Handle chars below
    for index := -1; index < (part-number.length + 1); index++:
      exception = catch:
        below-char := list-of-schematic-lines[part-number.line + 1][part-number.index + index]
        surrounding-characters.add "$(%c below-char)"
      if exception:
        print "Below char not found"

    // Check if one of the surrounding characters is a symbol
    is-valid := "false"
    surrounding-characters.do: | surrounding-char |
      symbols.do: | symbol |
        if symbol.stringify == surrounding-char:
          is-valid = "true"
    // Update the is-valid
    part-number.is-valid = is-valid
    print "--------------------------"
    print part-number.stringify
    print surrounding-characters.stringify
    print "--------------------------"

  // Loop and determine the sum of all the valid part numbers
  list-of-part-numbers.do: | part-number |
    if part-number.is-valid == "true":
      task-part-one-result-sum += int.parse part-number.value

/*
  _____           _     _______            
 |  __ \         | |   |__   __|           
 | |__) |_ _ _ __| |_     | |_      _____  
 |  ___/ _` | '__| __|    | \ \ /\ / / _ \ 
 | |  | (_| | |  | |_     | |\ V  V / (_) |
 |_|   \__,_|_|   \__|    |_| \_/\_/ \___/ 
                                           
                                           
The engineer finds the missing part and installs it in the engine! As the engine springs to life, you jump in the closest gondola, finally ready to ascend to the water source.

You don't seem to be going very fast, though. Maybe something is still wrong? Fortunately, the gondola has a phone labeled "help", so you pick it up and the engineer answers.

Before you can explain the situation, she suggests that you look out the window. There stands the engineer, holding a phone in one hand and waving with the other. You're going so slowly that you haven't even left the station. You exit the gondola.

The missing part wasn't the only issue - one of the gears in the engine is wrong. A gear is any * symbol that is adjacent to exactly two part numbers. Its gear ratio is the result of multiplying those two numbers together.

This time, you need to find the gear ratio of every gear and add them all up so that the engineer can figure out which gear needs to be replaced.

Consider the same engine schematic again:

467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..
In this schematic, there are two gears. The first is in the top left; it has part numbers 467 and 35, so its gear ratio is 16345. The second gear is in the lower right; its gear ratio is 451490. (The * adjacent to 617 is not a gear because it is only adjacent to one part number.) Adding up all of the gear ratios produces 467835.

What is the sum of all of the gear ratios in your engine schematic?
*/

class GearRatio:
  line /int? := null
  index /int? := null
  ratio /int? := null
  part-numbers /List? := ?

  stringify -> string:
    return "Line: $line, Index: $index, Ratio: $ratio, Part-numbers: $part-numbers"
    
  
  constructor .line .index .part-numbers:


task-part-two:
  print "---------PART Two---------"
  list-of-gear-ratios := []
  list-of-schematic-lines := []
  symbol-gear-ratio := "*"

  // Read lines from schematic
  input-string.split "\n": | line |
    list-of-schematic-lines.add (line)
    // print list-of-schematic-lines

  // Iterate Lines in schematic to find all occurences of an asterisk
  for line := 0; line < list-of-schematic-lines.size; line++:
    str-line := list-of-schematic-lines[line]
    // last-cursor-was-number := false
    // Iterate characters in each line
    for cursor := 0; cursor < str-line.size; cursor++:
      // init string character from its unicode code point
      str-char := "$(%c str-line[cursor])"
      if str-char == "*":
        list-of-gear-ratios.add (GearRatio line cursor [])

  // Now we need to check around the numbers for symbols
  list-of-part-numbers.do: | part-number |
    // print part-number.stringify
    surrounding-asterisks := []
    // Handle left char
    exception := catch:
      left-char := "$(%c list-of-schematic-lines[part-number.line][part-number.index - 1])"
      if left-char == symbol-gear-ratio:
        surrounding-asterisks.add [part-number.line, part-number.index - 1]
    if exception:
    //   print "Left char not found"
    // Handle right char
    exception = catch:
      right-char := "$(%c list-of-schematic-lines[part-number.line][part-number.index + part-number.length])"
      if right-char == symbol-gear-ratio:
        surrounding-asterisks.add [part-number.line, part-number.index + part-number.length]
    if exception:
    //   print "Right char not found"
    
    // Handle chars above
    for index := -1; index < (part-number.length + 1); index++:
      exception = catch:
        above-char := "$(%c list-of-schematic-lines[part-number.line - 1][part-number.index + index])"
        if above-char == symbol-gear-ratio:
          surrounding-asterisks.add [part-number.line - 1, part-number.index + index]
      if exception:
        // print "Above char not found"
    
    // Handle chars below
    for index := -1; index < (part-number.length + 1); index++:
      exception = catch:
        below-char := "$(%c list-of-schematic-lines[part-number.line + 1][part-number.index + index])"
        if below-char == symbol-gear-ratio:
          surrounding-asterisks.add [(part-number.line + 1), (part-number.index + index)]
      if exception:
        // print "Below char not found"
    
    // Iterate through list of gear ratios and assign the part number
    list-of-gear-ratios.do: | gear-ratio |
      surrounding-asterisks.do: | asterisk |
        if asterisk[0] == gear-ratio.line and asterisk[1] == gear-ratio.index:
          gear-ratio.part-numbers.add part-number.value
  
  // Compute the ratio
  list-of-gear-ratios.do: | gear-ratio |
    if gear-ratio.part-numbers.size == 2:
      gear-ratio.ratio = (int.parse gear-ratio.part-numbers[0]) * (int.parse gear-ratio.part-numbers[1])

  // Sum the ratios
  list-of-gear-ratios.do: | gear-ratio |
    if gear-ratio.ratio != null:
      task-part-two-result-sum += gear-ratio.ratio

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