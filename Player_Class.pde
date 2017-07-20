// Filename: 
// Camp: Venture Codemakers Advanced
// Date: Summer 2017
// Camper Name: 

/************************************************************************
 *                         PLAYER CLASS
 *  
 *   Creates the player and gives it the basic functionality.
 *   You do not need to change any code in this file.
 *
 ***********************************************************************/
public class Player extends Sprite {
  // Constructor
  Player(int x, int y, PImage img) {
    super(x, y, img);

    // Set Defense
    setDefense(5);
    // Set Attack
    setAttack(5);
  }

  // Attack 1
  int attack1() {
    return 6;
  }

  // Attack 2
  int attack2() {
    return 3;
  }

  // Dodge
  void dodge() {
  }
}