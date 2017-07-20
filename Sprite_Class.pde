// Filename: Sprite_Class
// Camp: Venture Codemakers Advanced
// Date: Summer 2017
// Camper Name: 

/************************************************************************
 *                         SPRITE CLASS
 *  
 *   Creates the sprites and gives them their basic functionality.
 *   You do not need to change any code in this file.
 *
 ***********************************************************************/
abstract class Sprite {
  int x, y, xSpeed, ySpeed = 0;
  int health, attack, defense;
  PImage img;

  // This is the constructor. It creates a new Sprite.
  Sprite(int startX, int startY, PImage startPic) {
    x = startX;
    y = startY;
    img = startPic;
    health = 100;
    attack = 0;
    defense = 0;
  }

  // Actions when the Sprite is in the game mode.
  public void game() {
    x += xSpeed;
    y += ySpeed;
    image(img, x, y, 64, 64);
  }

  // Actions when Sprite is in a battle.
  public void battle() {
    image(img, x, y, 128, 128);
    drawStats();
  }


  /* Movement functions.
   * Only run while in game mode.
   * Move Left
   */
  public void moveLeft() {
    xSpeed = -1;
  }
  public void moveRight() {
    xSpeed = 1;
  }
  public void moveUp() {
    ySpeed = -1;
  }
  public void moveDown() {
    ySpeed = 1;
  }
  public void stop() {
    xSpeed = 0;
    ySpeed = 0;
  }


  /* Get and Set Functions
   * Get/Set health, attack, defense
   */
  public int getHealth() {
    return health;
  } 
  public void setHealth(int change) {
    health += change;
  }
  public int getAttack() {
    return attack;
  } 
  public void setAttack(int change) {
    attack += change;
  }
  public int getDefense() {
    return defense;
  } 
  public void setDefense(int change) {
    defense += change;
  }


  // Draws the stats to the screen below the player.
  public void drawStats() {
    textSize(16);
    textAlign(LEFT, CENTER);
    text("Health: "+ health, x, y+200);
    text("Defense: "+ defense, x, y+220);
    text("Attack: "+ attack, x, y+240);
  }
  
  abstract int attack1();
  abstract int attack2();
  abstract void dodge();
}