/*
███████████████████████████████████████████████████████████████████████████████████████████████████
██▀▄─██▄─▄▄▀█▄─█─▄█▄─▄▄─█▄─▀█▄─▄█─▄─▄─███─▄▄─█▄─▄▄─███─▄▄▄─█─▄▄─█▄─▄▄▀█▄─▄▄─███▀▄▄▀█─▄▄─█▀▄▄▀█▄▄▄░█
██─▀─███─██─██▄▀▄███─▄█▀██─█▄▀─████─█████─██─██─▄█████─███▀█─██─██─██─██─▄█▀████▀▄██─██─██▀▄███▄▄░█
▀▄▄▀▄▄▀▄▄▄▄▀▀▀▀▄▀▀▀▄▄▄▄▄▀▄▄▄▀▀▄▄▀▀▄▄▄▀▀▀▀▄▄▄▄▀▄▄▄▀▀▀▀▀▄▄▄▄▄▀▄▄▄▄▀▄▄▄▄▀▀▄▄▄▄▄▀▀▀▄▄▄▄▀▄▄▄▄▀▄▄▄▄▀▄▄▄▄▀
  _____                ___       _____      _             _____                            _                      
 |  __ \              |__ \ _   / ____|    | |           / ____|                          | |                     
 | |  | | __ _ _   _     ) (_) | |    _   _| |__   ___  | |     ___  _ __  _   _ _ __   __| |_ __ _   _ _ __ ___  
 | |  | |/ _` | | | |   / /    | |   | | | | '_ \ / _ \ | |    / _ \| '_ \| | | | '_ \ / _` | '__| | | | '_ ` _ \ 
 | |__| | (_| | |_| |  / /_ _  | |___| |_| | |_) |  __/ | |___| (_) | | | | |_| | | | | (_| | |  | |_| | | | | | |
 |_____/ \__,_|\__, | |____(_)  \_____\__,_|_.__/ \___|  \_____\___/|_| |_|\__,_|_| |_|\__,_|_|   \__,_|_| |_| |_|
                __/ |                                                                                             
               |___/                                                                                                                                                         

Isaiah 7:14
  Therefore the Lord himself will give you a sign. 
  Behold, the virgin shall conceive and bear a son, 
  and shall call his name Immanuel.
*/

import .input

task-part-one-result /int := 0
task-part-two-result /int := 0

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

You're launched high into the atmosphere! The apex of your trajectory just barely reaches the surface of a large island floating in the sky. You gently land in a fluffy pile of leaves. It's quite cold, but you don't see much snow. An Elf runs over to greet you.

The Elf explains that you've arrived at Snow Island and apologizes for the lack of snow. He'll be happy to explain the situation, but it's a bit of a walk, so you have some time. They don't get many visitors up here; would you like to play a game in the meantime?

As you walk, the Elf shows you a small bag and some cubes which are either red, green, or blue. Each time you play this game, he will hide a secret number of cubes of each color in the bag, and your goal is to figure out information about the number of cubes.

To get information, once a bag has been loaded with cubes, the Elf will reach into the bag, grab a handful of random cubes, show them to you, and then put them back in the bag. He'll do this a few times per game.

You play several games and record the information from each game (your puzzle input). Each game is listed with its ID number (like the 11 in Game 11: ...) followed by a semicolon-separated list of subsets of cubes that were revealed from the bag (like 3 red, 5 green, 4 blue).

For example, the record of a few games might look like this:

Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
In game 1, three sets of cubes are revealed from the bag (and then put back again). The first set is 3 blue cubes and 4 red cubes; the second set is 1 red cube, 2 green cubes, and 6 blue cubes; the third set is only 2 green cubes.

The Elf would first like to know which games would have been possible if the bag contained only 12 red cubes, 13 green cubes, and 14 blue cubes?

In the example above, games 1, 2, and 5 would have been possible if the bag had been loaded with that configuration. However, game 3 would have been impossible because at one point the Elf showed you 20 red cubes at once; similarly, game 4 would also have been impossible because the Elf showed you 15 blue cubes at once. If you add up the IDs of the games that would have been possible, you get 8.

Determine which games would have been possible if the bag had been loaded with only 12 red cubes, 13 green cubes, and 14 blue cubes. What is the sum of the IDs of those games?                
*/
task-part-one:  
  print "---------PART One---------"
  list-of-game-strings := []
  count-of-possible-games-ids := 0
  // Break input string into list of strings for each line
  input-string.split "\n": | string-line |
    list-of-game-strings.add (string-line)
  
  // Parse and construct new data structure
  list-of-game-strings.do: | string-all |
    possible := true
    // print string-all
    string-game := (string-all.split ":")[0]
    // print string-game
    int-game := int.parse ((string-game.trim --left "Game").trim)
    // print ("Game: " + int-game.stringify)
    string-all-rounds := (string-all.split ":")[1]
    // print ("Game: " + int-game.stringify + " List: " + string-all-rounds.stringify)
    list-all-rounds := string-all-rounds.split ";"
    // print ("Game: " + int-game.stringify + " List: " + list-all-rounds.stringify)
    list-color-sets := []
    list-all-rounds.do: | round |
      list-color-sets.add (round.split ",")
    // print ("Game: " + int-game.stringify + " List: " + list-color-sets.stringify)
    
    list-of-rounds := []
    list-color-sets.do: | round |
      list-of-cubes := []
      round.do: | cube |
        list-cube := cube.split (" ") --drop-empty
        // print list-cube
        cube-number := list-cube[0]
        // print cube-number
        cube-color := list-cube[1]
        // print cube-color
        // print ("Game: " + int-game.stringify + " Num: " + cube-number.stringify + " Color: " + cube-color.stringify)
        list-of-cubes.add ([cube-color, cube-number])
        
        // Cross check cube limit and determine if not possible
        input-list-max-cube-per-color.do: | cube-limit |
          if cube-limit[0] == cube-color:
            cube-color-found := int.parse cube-number
            // print cube-color-found
            cube-color-limit := cube-limit[1]
            // print cube-color-limit
            if (cube-color-found > cube-color-limit):
              print ("Color: " + cube-color + " - Not possible: " + cube-color-found.stringify + " >= " + cube-color-limit.stringify)
              possible = false
      // Sort list to match color order of input list
      list-of-cubes.sort --in-place: | a b | b[0].compare_to a[0]
      list-of-rounds.add list-of-cubes
    
    print ("Game: " + int-game.stringify + "\n  List: " + list-of-rounds.stringify)
    print ("Possible: " + possible.stringify + "\n")
    if possible == true: count-of-possible-games-ids += int-game

  task-part-one-result = count-of-possible-games-ids


/*
  _____           _     _______            
 |  __ \         | |   |__   __|           
 | |__) |_ _ _ __| |_     | |_      _____  
 |  ___/ _` | '__| __|    | \ \ /\ / / _ \ 
 | |  | (_| | |  | |_     | |\ V  V / (_) |
 |_|   \__,_|_|   \__|    |_| \_/\_/ \___/ 
                                           
The Elf says they've stopped producing snow because they aren't getting any water! He isn't sure why the water stopped; however, he can show you how to get to the water source to check it out for yourself. It's just up ahead!

As you continue your walk, the Elf poses a second question: in each game you played, what is the fewest number of cubes of each color that could have been in the bag to make the game possible?

Again consider the example games from earlier:

Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
In game 1, the game could have been played with as few as 4 red, 2 green, and 6 blue cubes. If any color had even one fewer cube, the game would have been impossible.
Game 2 could have been played with a minimum of 1 red, 3 green, and 4 blue cubes.
Game 3 must have been played with at least 20 red, 13 green, and 6 blue cubes.
Game 4 required at least 14 red, 3 green, and 15 blue cubes.
Game 5 needed no fewer than 6 red, 3 green, and 2 blue cubes in the bag.
The power of a set of cubes is equal to the numbers of red, green, and blue cubes multiplied together. The power of the minimum set of cubes in game 1 is 48. In games 2-5 it was 12, 1560, 630, and 36, respectively. Adding up these five powers produces the sum 2286.

For each game, find the minimum set of cubes that must have been present. What is the sum of the power of these sets?                                       

*/
task-part-two:
  print "---------PART Two---------"
  list-of-game-strings := []
  count-of-game-powers := 0
  // Break input string into list of strings for each line
  input-string.split "\n": | string-line |
    list-of-game-strings.add (string-line)
  
  // Parse and construct new data structure
  list-of-games := []
  list-of-game-strings.do: | string-all |
    possible := true
    // print string-all
    string-game := (string-all.split ":")[0]
    // print string-game
    int-game := int.parse ((string-game.trim --left "Game").trim)
    // print ("Game: " + int-game.stringify)
    string-all-rounds := (string-all.split ":")[1]
    // print ("Game: " + int-game.stringify + " List: " + string-all-rounds.stringify)
    list-all-rounds := string-all-rounds.split ";"
    // print ("Game: " + int-game.stringify + " List: " + list-all-rounds.stringify)
    list-color-sets := []
    list-all-rounds.do: | round |
      list-color-sets.add (round.split ",")
    // print ("Game: " + int-game.stringify + " List: " + list-color-sets.stringify)
    
    list-of-rounds := []
    list-color-sets.do: | round |
      list-of-cubes := []
      round.do: | cube |
        list-cube := cube.split (" ") --drop-empty
        // print list-cube
        cube-number := list-cube[0]
        // print cube-number
        cube-color := list-cube[1]
        // print cube-color
        // print ("Game: " + int-game.stringify + " Num: " + cube-number.stringify + " Color: " + cube-color.stringify)
        list-of-cubes.add ([cube-color.stringify, cube-number.stringify])
        
        // Cross check cube limit and determine if not possible
        input-list-max-cube-per-color.do: | cube-limit |
          if cube-limit[0] == cube-color:
            cube-color-found := int.parse cube-number
            // print cube-color-found
            cube-color-limit := cube-limit[1]
            // print cube-color-limit
      // Sort list to match color order of input list
      list-of-cubes.sort --in-place: | a b | b[0].compare_to a[0]
      list-of-rounds.add list-of-cubes
    list-of-games.add list-of-rounds
    
    // print ("Game: " + int-game.stringify + "\n  List: " + list-of-rounds.stringify)
    // print ("Possible: " + possible.stringify + "\n")
    // if possible == true: count-of-possible-games-ids += int-game
  
  
  list-of-games.do: | list-of-rounds |
    list-min-cube-per-color := [["red",0],["green",0],["blue",0]]
    // string-game := (list-of-rounds.split ":")[0]
    // int-game := int.parse ((string-game.trim --left "Game").trim)
    // print list-of-rounds
    list-of-rounds.do: | list-of-cubes |
    //   print list-of-cubes
      list-of-cubes.do: | cube |
        for color-index := 0; color-index < list-min-cube-per-color.size; color-index++:
          color := list-min-cube-per-color[color-index][0]
        //   print color
          cube-min := (list-min-cube-per-color[color-index])[1].stringify
        //   print "cube-min: " + cube-min
          cube-count := cube[1].stringify
        //   print "cube-count: " + cube-count
          if color == cube[0]:
            // print "Color Match: " + color.stringify
            if ((int.parse cube-min) < (int.parse cube-count)):
              list-min-cube-per-color[color-index][1] = cube[1]

    print ("List: " + list-min-cube-per-color.stringify)
    game-power := 1
    list-min-cube-per-color.do: | cube |
      game-power = game-power * (int.parse (cube[1]))
    
    count-of-game-powers += game-power 

  task-part-two-result = count-of-game-powers

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
  print "Part One - Final Result: " + "$task-part-one-result"
  print "Part Two - Final Result: " + "$task-part-two-result"
  print "-------------------------------------------------------"