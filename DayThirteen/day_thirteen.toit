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
                                           
                                           

*/
task-part-two:
  print "---------PART Two---------"
  

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
//   print "Part Two - Final Result: " + "$task-part-two-result-sum"
  print "-------------------------------------------------------"