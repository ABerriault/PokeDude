// Sprite Class
// CodeMakers Advanced
// YOUR NAME

public class Sprite {
  int x = 0;
  int y = 0;
  PImage img;
  int health;
  int attack;
  int defense;
  int speed;

  // This is the constructor. It creates a new Sprite.
  Sprite(int startX, int startY, PImage startPic, int startHealth) {
    x = startX;
    y = startY;
    img = startPic;
    health = startHealth;
    attack = 0;
    defense = 0;
    speed = 1;
  }

  // This will draw the Sprite.
  public void draw() {
    image(img, x, y, 128, 128);
    text("Health: "+ health, x, y+200);
    text("Defense: "+ defense, x, y+220);
    text("Attack: "+ attack, x, y+240);
    text("Speed: "+ speed, x, y+260);
  }

  // Move Left
  public void moveLeft() {
    x = x - speed;
  }

  // Move Right
  public void moveRight() {
    x = x + speed;
  }

  // Move Up
  public void moveUp() {
    y = y - speed;
  }

  // Move Down
  public void moveDown() {
    y = y + speed;
  }

  // Get and Set the health.
  public int getHealth() {
    return health;
  } 
  public void setHealth(int change) {
    health += change;
  }

  // Get and Set the attack.
  public int getAttack() {
    return attack;
  } 
  public void setAttack(int change) {
    attack += change;
  }

  // Get and Set the attack.
  public int getDefense() {
    return defense;
  } 
  public void setDefense(int change) {
    defense += change;
  }

  // Get and Set the attack.
  public int getSpeed() {
    return speed;
  } 
  public void setSpeed(int change) {
    speed += change;
  }
}