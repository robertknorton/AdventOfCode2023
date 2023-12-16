/*
███████████████████████████████████████████████████████████████████████████████████████████████████
██▀▄─██▄─▄▄▀█▄─█─▄█▄─▄▄─█▄─▀█▄─▄█─▄─▄─███─▄▄─█▄─▄▄─███─▄▄▄─█─▄▄─█▄─▄▄▀█▄─▄▄─███▀▄▄▀█─▄▄─█▀▄▄▀█▄▄▄░█
██─▀─███─██─██▄▀▄███─▄█▀██─█▄▀─████─█████─██─██─▄█████─███▀█─██─██─██─██─▄█▀████▀▄██─██─██▀▄███▄▄░█
▀▄▄▀▄▄▀▄▄▄▄▀▀▀▀▄▀▀▀▄▄▄▄▄▀▄▄▄▀▀▄▄▀▀▄▄▄▀▀▀▀▄▄▄▄▀▄▄▄▀▀▀▀▀▄▄▄▄▄▀▄▄▄▄▀▄▄▄▄▀▀▄▄▄▄▄▀▀▀▄▄▄▄▀▄▄▄▄▀▄▄▄▄▀▄▄▄▄▀
  _____                __ ____      _____      _       _            __   _____            _     _                     
 |  __ \              /_ |___ \ _  |  __ \    (_)     | |          / _| |_   _|          (_)   | |                    
 | |  | | __ _ _   _   | | __) (_) | |__) |__  _ _ __ | |_    ___ | |_    | |  _ __   ___ _  __| | ___ _ __   ___ ___ 
 | |  | |/ _` | | | |  | ||__ <    |  ___/ _ \| | '_ \| __|  / _ \|  _|   | | | '_ \ / __| |/ _` |/ _ \ '_ \ / __/ _ \
 | |__| | (_| | |_| |  | |___) |_  | |  | (_) | | | | | |_  | (_) | |    _| |_| | | | (__| | (_| |  __/ | | | (_|  __/
 |_____/ \__,_|\__, |  |_|____/(_) |_|   \___/|_|_| |_|\__|  \___/|_|   |_____|_| |_|\___|_|\__,_|\___|_| |_|\___\___|
                __/ |                                                                                                 
               |___/                                                                                                                                                               
Luke 2:6-7
  And while they were there, the time came for her to give birth.
  And she gave birth to her firstborn son and wrapped him in swaddling cloths 
  and laid him in a manger, because there was no place for them in the inn.
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
                                          
With your help, the hot springs team locates an appropriate spring which launches you neatly and precisely up to the edge of Lava Island.

There's just one problem: you don't see any lava.

You do see a lot of ash and igneous rock; there are even what look like gray mountains scattered around. After a while, you make your way to a nearby cluster of mountains only to discover that the valley between them is completely full of large mirrors. Most of the mirrors seem to be aligned in a consistent way; perhaps you should head in that direction?

As you move through the valley of mirrors, you find that several of them have fallen from the large metal frames keeping them in place. The mirrors are extremely flat and shiny, and many of the fallen mirrors have lodged into the ash at strange angles. Because the terrain is all one color, it's hard to tell where it's safe to walk or where you're about to run into a mirror.

You note down the patterns of ash (.) and rocks (#) that you see as you walk (your puzzle input); perhaps by carefully analyzing these patterns, you can figure out where the mirrors are!

For example:

#.##..##.
..#.##.#.
##......#
##......#
..#.##.#.
..##..##.
#.#.##.#.

#...##..#
#....#..#
..##..###
#####.##.
#####.##.
..##..###
#....#..#
To find the reflection in each pattern, you need to find a perfect reflection across either a horizontal line between two rows or across a vertical line between two columns.

In the first pattern, the reflection is across a vertical line between two columns; arrows on each of the two columns point at the line between the columns:

123456789
    ><   
#.##..##.
..#.##.#.
##......#
##......#
..#.##.#.
..##..##.
#.#.##.#.
    ><   
123456789
In this pattern, the line of reflection is the vertical line between columns 5 and 6. Because the vertical line is not perfectly in the middle of the pattern, part of the pattern (column 1) has nowhere to reflect onto and can be ignored; every other column has a reflected column within the pattern and must match exactly: column 2 matches column 9, column 3 matches 8, 4 matches 7, and 5 matches 6.

The second pattern reflects across a horizontal line instead:

1 #...##..# 1
2 #....#..# 2
3 ..##..### 3
4v#####.##.v4
5^#####.##.^5
6 ..##..### 6
7 #....#..# 7
This pattern reflects across the horizontal line between rows 4 and 5. Row 1 would reflect with a hypothetical row 8, but since that's not in the pattern, row 1 doesn't need to match anything. The remaining rows match: row 2 matches row 7, row 3 matches row 6, and row 4 matches row 5.

To summarize your pattern notes, add up the number of columns to the left of each vertical line of reflection; to that, also add 100 multiplied by the number of rows above each horizontal line of reflection. In the above example, the first pattern's vertical line has 5 columns to its left and the second pattern's horizontal line has 4 rows above it, a total of 405.

Find the line of reflection in each of the patterns in your notes. What number do you get after summarizing all of your notes?                         
*/
task-part-one:  
  print "---------PART One---------"
  sum-of-reflection-notes := 0
  sum-of-horizontal-reflections := 0
  sum-of-vertical-reflections := 0
  // Split our input string into a list of reflection patterns
//   list-of-reflection-patterns := example-input-string.split "\n\n"
  list-of-reflection-patterns := input-string.split "\n\n"
  // Loop through each reflection pattern in our list
  for reflection-pattern := 0; reflection-pattern < list-of-reflection-patterns.size; reflection-pattern++:
    has-perfect-horizontal-reflection := false
    print "Pattern " + reflection-pattern.stringify + ": "
    // print list-of-reflection-patterns[reflection-pattern] + "\n"
    list-of-pattern-rows := list-of-reflection-patterns[reflection-pattern].split "\n"
    // Loop through each row in the pattern
    for pattern-row := 0; pattern-row < list-of-pattern-rows.size; pattern-row++:
    //   print "Row " + pattern-row.stringify + ": " + list-of-pattern-rows[pattern-row]
      current-row := list-of-pattern-rows[pattern-row]
      // Check if above or below rows match this row
      // Not necessary to check first and last row
      if 0 < pattern-row < list-of-pattern-rows.size:
        // Check above row
        above-row := list-of-pattern-rows[pattern-row - 1]
        // print above-row
        if (above-row == current-row):
          print "\tPotential Horizontal Reflection Found!"
          print "\t\tRow " + (pattern-row - 1).stringify + ":\t" + above-row.stringify
          print "\t\tRow " + pattern-row.stringify + ":\t" + current-row.stringify

          // We need to verify that it is a true line of reflection we will need to come back to this
          is-valid-reflection := true
          above-index-of-reflection := (pattern-row - 1)
          below-index-of-reflection := (pattern-row)
          // Check if every row above has a matching row below
          //for row := above-index-of-reflection - 1; row >= 0; row++:
          while is-valid-reflection:
            above-index-of-reflection = above-index-of-reflection - 1
            below-index-of-reflection = below-index-of-reflection + 1
            below-row := null
            exception := catch:
              above-row = list-of-pattern-rows[above-index-of-reflection]
              print "\t\t\tRow " + above-index-of-reflection.stringify + ":\t" + above-row.stringify
              below-row = list-of-pattern-rows[below-index-of-reflection]
              print "\t\t\tRow " + below-index-of-reflection.stringify + ":\t" + below-row.stringify
            if exception:
              print "\t\t\tFailed to get next row"
              break
            if above-row != below-row:
              is-valid-reflection = false
              break
          if is-valid-reflection:
            print "\tValid Perfect Horizontal Reflection Found!"
            has-perfect-horizontal-reflection = true
            num-rows-above := pattern-row
            print "\tNumber of Rows Above: " + num-rows-above.stringify
            sum-of-horizontal-reflections += (num-rows-above * 100)
            // Only find one valid reflection
            break
          else:
            print "\tNot a Perfect Horizontal Reflection."

          
    
    // Print out this patterns rows
    for pattern-row := 0; pattern-row < list-of-pattern-rows.size; pattern-row++:
      print "Row " + pattern-row.stringify + ": " + list-of-pattern-rows[pattern-row].stringify

    if has-perfect-horizontal-reflection == false:
      // Loop through every column in the pattern
      list-of-pattern-colunns := []
      // Construct a list of strings with the rows and columns transposed to make processing easier.
      for row := 0; row < list-of-pattern-rows.size; row++:
        //list-of-pattern-colunns.add []
      //   print "Row: " + row.stringify
        for column := 0; column < list-of-pattern-rows[row].size; column++:
          // print "Column: " + column.stringify
          if row == 0:
            list-of-pattern-colunns.add "$(%c list-of-pattern-rows[row][column])"
          //   print list-of-pattern-colunns.last.stringify
          else:
            list-of-pattern-colunns[column] = list-of-pattern-colunns[column].stringify + "$(%c list-of-pattern-rows[row][column])"
          //   print list-of-pattern-colunns[column].stringify
      
      // Now loop through each row in list of columns
      for pattern-column := 0; pattern-column < list-of-pattern-colunns.size; pattern-column++:
        //   print "Row " + pattern-row.stringify + ": " + list-of-pattern-rows[pattern-row]
          current-row := list-of-pattern-colunns[pattern-column]
          // Check if above or below rows match this row
          // Not necessary to check first and last row
          if 0 < pattern-column < list-of-pattern-colunns.size:
            // Check above row
            above-row := list-of-pattern-colunns[pattern-column - 1]
            // print above-row
            if (above-row == current-row):
              print "\tPotential Vertical Reflection Found!"
              print "\t\tColumn " + (pattern-column - 1).stringify + ":\t" + above-row.stringify
              print "\t\tColumn " + pattern-column.stringify + ":\t" + current-row.stringify

              // We need to verify that it is a true line of reflection we will need to come back to this
              is-valid-reflection := true
              above-index-of-reflection := (pattern-column - 1)
              below-index-of-reflection := (pattern-column)
              // Check if every row above has a matching row below
              //for row := above-index-of-reflection - 1; row >= 0; row++:
              while is-valid-reflection:
                above-index-of-reflection = above-index-of-reflection - 1
                below-index-of-reflection = below-index-of-reflection + 1
                below-row := null
                exception := catch:
                  above-row = list-of-pattern-colunns[above-index-of-reflection]
                  print "\t\t\tColumn " + above-index-of-reflection.stringify + ":\t" + above-row.stringify
                  below-row = list-of-pattern-colunns[below-index-of-reflection]
                  print "\t\t\tColumn " + below-index-of-reflection.stringify + ":\t" + below-row.stringify
                if exception:
                  print "\t\t\tFailed to get next row"
                  break
                if above-row != below-row:
                  is-valid-reflection = false
                  break
              if is-valid-reflection:
                print "\tValid Perfect Vertical Reflection Found!"
                num-columns-left := pattern-column
                print "\tNumber of Columns Left: " + num-columns-left.stringify
                sum-of-vertical-reflections += (num-columns-left)
                // Only find one valid reflection
                break
              else:
                print "\tNot a Perfect Vertical Reflection."

      // Print out this patterns columns transposed into rows
      for pattern-column := 0; pattern-column < list-of-pattern-colunns.size; pattern-column++:
        print "Column " + pattern-column.stringify + ": " + list-of-pattern-colunns[pattern-column].stringify

    

  sum-of-reflection-notes = sum-of-horizontal-reflections + sum-of-vertical-reflections
  task-part-one-result-sum = sum-of-reflection-notes

/*
  _____           _     _______            
 |  __ \         | |   |__   __|           
 | |__) |_ _ _ __| |_     | |_      _____  
 |  ___/ _` | '__| __|    | \ \ /\ / / _ \ 
 | |  | (_| | |  | |_     | |\ V  V / (_) |
 |_|   \__,_|_|   \__|    |_| \_/\_/ \___/ 
                                           
You resume walking through the valley of mirrors and - SMACK! - run directly into one. Hopefully nobody was watching, because that must have been pretty embarrassing.

Upon closer inspection, you discover that every mirror has exactly one smudge: exactly one . or # should be the opposite type.

In each pattern, you'll need to locate and fix the smudge that causes a different reflection line to be valid. (The old reflection line won't necessarily continue being valid after the smudge is fixed.)

Here's the above example again:

#.##..##.
..#.##.#.
##......#
##......#
..#.##.#.
..##..##.
#.#.##.#.

#...##..#
#....#..#
..##..###
#####.##.
#####.##.
..##..###
#....#..#
The first pattern's smudge is in the top-left corner. If the top-left # were instead ., it would have a different, horizontal line of reflection:

1 ..##..##. 1
2 ..#.##.#. 2
3v##......#v3
4^##......#^4
5 ..#.##.#. 5
6 ..##..##. 6
7 #.#.##.#. 7
With the smudge in the top-left corner repaired, a new horizontal line of reflection between rows 3 and 4 now exists. Row 7 has no corresponding reflected row and can be ignored, but every other row matches exactly: row 1 matches row 6, row 2 matches row 5, and row 3 matches row 4.

In the second pattern, the smudge can be fixed by changing the fifth symbol on row 2 from . to #:

1v#...##..#v1
2^#...##..#^2
3 ..##..### 3
4 #####.##. 4
5 #####.##. 5
6 ..##..### 6
7 #....#..# 7
Now, the pattern has a different horizontal line of reflection between rows 1 and 2.

Summarize your notes as before, but instead use the new different reflection lines. In this example, the first pattern's new horizontal line has 3 rows above it and the second pattern's new horizontal line has 1 row above it, summarizing to the value 400.

In each pattern, fix the smudge and find the different line of reflection. What number do you get after summarizing the new reflection line in each pattern in your notes?                                      

*/

parse_input_string input:
  list-of-reflection-patterns := input.split "\n\n"
  list-of-lines-in-pattern := []
  list-of-reflection-patterns.do: | line |
    list-of-lines-in-pattern.add (line.split "\n")
  return list-of-lines-in-pattern
  // Print our parsed patterns for debugging
//   for x := 0 ; x < list-of-lines-in-pattern.size; x++:
//     print "Pattern " + x.stringify
//     for y := 0 ; y < list-of-lines-in-pattern[x].size; y++:
//       print "\tLine " + y.stringify + ": " + list-of-lines-in-pattern[x][y].stringify
  
compute_score pattern:
  result := null
  hrz-reflec-line-index := find_hrz_reflec_index pattern

  if hrz-reflec-line-index == null:
    vrt_reflec_line_index := find_vrt_reflec_index pattern
    // if vrt_reflec_line_index == null:
    //   result = 0
    // else:
    result = vrt-reflec-line-index + 1
    print "Vertical reflection line " + vrt-reflec-line-index.stringify + ": " + result.stringify
    return result
    
  if hrz-reflec-line-index == null:
    result = 0
  else:
    result = (hrz-reflec-line-index + 1) * 100
    print "Horizontal reflection line " + hrz-reflec-line-index.stringify + ": " + result.stringify
  return result

find_hrz_reflec_index pattern:
  reflection-index := null
  for line := 0; line < (pattern.size - 1); line++:
    if is_hrz_reflec_line line (line + 1) pattern true:
      reflection-index = line
      break
  return reflection-index

find_vrt_reflec_index pattern:
  reflection-index := null
  for line := 0; line < (pattern[0].size - 1); line++:
    if is_vrt_reflec_line line (line + 1) pattern true:
      reflection-index = line
      break
  return reflection-index

is_hrz_reflec_line index1 index2 pattern is-smudge-avaiable:
  if index1 < 0:
    if is-smudge-avaiable:
      // Require exactly one smudge
      return false
    else:
      return true
  if index2 > (pattern.size - 1):
    if is-smudge-avaiable:
      // Require exactly one smudge
      return false
    else:
      return true
  
  row1 := null
  row2 := null
  number-of-differences := 0
  exception := catch:
    row1 = pattern[index1]
    row2 = pattern[index2]
    number-of-differences = compute_number_of_different_chars row1 row2
  if exception:
    print "\t\t\tFailed to get next row"
    return false
  
  print "\tRow " + index1.stringify + ": " + row1.stringify
  print "\tRow " + index2.stringify + ": " + row2.stringify
  print "\tNumber of differences: " + number-of-differences.stringify

  if number-of-differences > 1:
    return false
  else if number-of-differences == 1:
    if is-smudge-avaiable:
      return is-hrz-reflec-line (index1 - 1) (index2 + 1) pattern false
    else:
      return false
  return is-hrz-reflec-line (index1 - 1) (index2 + 1) pattern is-smudge-avaiable

is_vrt_reflec_line index1 index2 pattern is-smudge-avaiable:
  if index1 < 0:
    if is-smudge-avaiable:
      // Require exactly one smudge
      return false
    else:
      return true
  if index2 > (pattern[0].size - 1):
    if is-smudge-avaiable:
      // Require exactly one smudge
      return false
    else:
      return true
  
  column1 := []
  column2 := []
  number-of-differences := 0
  exception := catch:
    pattern.do: | line |
      column1.add ("$(%c line[index1])")
      column2.add ("$(%c line[index2])")
    // column1 = pattern[index1].split ("")
    // column2 = pattern[index2].split ("")
    number-of-differences = compute_number_of_different_chars column1 column2
  if exception:
    print "\t\t\tFailed to get next row"
    return false

  print "\tColumn " + index1.stringify + ": " + column1.stringify
  print "\tColumn " + index2.stringify + ": " + column2.stringify
  print "\tNumber of differences: " + number-of-differences.stringify

  if number-of-differences > 1:
    print "\t\t\tToo many differences"
    return false
  else if number-of-differences == 1:
    print "\t\t\tOne difference"
    if is-smudge-avaiable:
      return is-vrt-reflec-line (index1 - 1) (index2 + 1) pattern false
    else:
      return false
  return is-vrt-reflec-line (index1 - 1) (index2 + 1) pattern is-smudge-avaiable
  
compute_number_of_different_chars list1 list2:
  if list1.size != list2.size:
    // Lists must be the same size
    return null
  // Count the differences
  count-of-differences := 0
  for i := 0; i < list1.size; i++:
    if list1[i] != list2[i]:
      count-of-differences += 1
  return count-of-differences

task-part-two:
  print "---------PART Two---------"
  sum-of-reflection-notes := 0
  sum-of-horizontal-reflections := 0
  sum-of-vertical-reflections := 0

  list-of-patterns :=parse-input-string input-string

  for x := 0; x < list-of-patterns.size; x++:
    pattern := list-of-patterns[x]
    print "Pattern " + x.stringify + ": "
    pattern.do: | line |
      print "\t" + line.stringify
    sum-of-reflection-notes += compute_score pattern
    
  task-part-two-result-sum = sum-of-reflection-notes

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