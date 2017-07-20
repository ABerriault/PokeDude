// Filename: PokeDude
// Camp: Venture Codemakers Advanced
// Date: Summer 2017
// Camper Name: 


/************************************************************************
 *                         GLOBAL VARIABLES
 *  
 *  These are variables that are used throughout the game. They set up 
 *  things such as the player and lists for enemies and projectiles.
 *
 *
 ***********************************************************************/
Sprite player;
Sprite enemy;
Sprite[] pokemon;
int numOfPokemon = 2;

static final int START = -1;
static final int GAME = 0;
static final int BATTLE = 1;
static final int OVER = 2;
int STATE = START;

int experience;
String warningMessage = "";
int time = 0;


/************************************************************************
 *                         SETUP METHOD
 *  
 *   This code is run ONLY once at the very begining of the program.
 *
 *
 ***********************************************************************/
void setup() {
  size(600, 600);
  fill(255);
  textSize(12);
  textAlign(CENTER, CENTER);

  // Set up the player.
  player = new Player (25, 300, loadImage("Sprites/Player.png"));

  // Set up the all the PokeDudes!
  pokemon = new Sprite[numOfPokemon];
  pokemon[0] = new Pikachu(400, 300, loadImage("Sprites/Pikachu.png"));
  pokemon[1] = new Pikachu(200, 100, loadImage("Sprites/Pokemon0.png"));
}


/************************************************************************
 *                         DRAW METHOD
 *  
 *   This code is run EVERY FRAME while the programming is running.
 *
 *
 ***********************************************************************/
void draw() {
  background(130, 200, 150);
  displayWarnings();
  time++;

  if (STATE == START) {
    textSize(64);
    textAlign(CENTER, CENTER);
    text("PokeDude!", 0, 0, width, height);
    textSize(32);
    text("Press the Spacebar to begin.", 0, 100, width, height);
  } else if (STATE == GAME) {
    textSize(16);
    textAlign(LEFT, TOP);
    text("XP: " + experience, 5, 5, width, height);
    player.game();
    for (int i = 0; i < pokemon.length; i++) {
      pokemon[i].game();
    }
  } else if (STATE == BATTLE) {
    if (player.getHealth() <= 0) {
      STATE = OVER;
    } else if (enemy.getHealth() <= 0) {
      experience += 30;
      STATE = GAME;
      player.stop();
      enemy.setHealth(100);
    }
    player.x = 50;
    player.y = 200;
    enemy.x = 400;
    enemy.y = 200;
    player.battle();
    enemy.battle();
  } else if (STATE == OVER) {
    textSize(64);
    textAlign(CENTER, CENTER);
    text("Game Over", 0, 0, width, height);
    textSize(32);
    text("Press R to restart. Press Q to quit.", 0, 100, width, height);
  } else {
    STATE = OVER;
  }
}


/************************************************************************
 *                         keyPressed METHOD
 *  
 *  This method is run everytime an input is recieved from the keyboard.
 *  By using if(), else if(), and else statements, you can bind commands
 *  to specific keys.
 *
 ***********************************************************************/
void keyPressed() {
  // The Game Start Screen
  // The player can choose to begin or quit.
  if (STATE == START) {
    if (key == ' ') {
      STATE = GAME;
    } else if (key == 'Q' || key == 'q') {
      STATE = OVER;
    }
  }

  // The Game Over Screen
  // The player can choose to restart or quit
  else if (STATE == GAME) {
    if (key == 'W' || key == 'w') {
      player.moveUp();
    } else if (key == 'A' || key == 'a') {
      player.moveLeft();
    } else if (key == 'S' || key == 's') {
      player.moveDown();
    } else if (key == 'D' || key == 'd') {
      player.moveRight();
    } else if (key == ' ') {
      enemy = getPokemon();
      if (enemy == null) {
        warningMessage = "No PokeDudes near by";
      } else {
        STATE = BATTLE;
      }
    } else if (key == 'Q' || key == 'q') {
      STATE = OVER;
    }
  } 

  // The Game Over Screen
  // The player can choose to restart or quit
  else if (STATE == BATTLE) {
    if (key == '1') {
      // Attack 1
      int pA = player.attack1();
      int eA = enemy.attack1();
      enemy.setHealth(-pA);
      player.setHealth(-eA);
    } else if (key == '2') {
      // Attack 2
      int pA = player.attack2();
      int eA = enemy.attack2();
      enemy.setHealth(-pA);
      player.setHealth(-eA);
    } else if (key == 'Q' || key == 'q') {
      STATE = OVER;
    }
  }


  // The Game Over Screen
  // The player can choose to restart or quit
  else if (STATE == OVER) {
    if (key == 'R' || key == 'r') {
      player.setHealth(80);
      experience = 0;
      STATE = GAME;
    } else if (key == 'Q' || key == 'q') {
      exit();
    }
  } 

  // If the state gets messed up. Send it back to the Start Screen.
  else {
    STATE = START;
  }
}


/************************************************************************
 *                         keyReleased METHOD
 *  
 *  This method is run everytime an input is released from the keyboard.
 *  By using if(), else if(), and else statements, you can bind commands
 *  to specific keys being let go.
 *
 ***********************************************************************/
void keyReleased() {
  if (STATE == GAME) {
    if (key == 'W' || key == 'w') {
      player.stop();
    } else if (key == 'A' || key == 'a') {
      player.stop();
    } else if (key == 'S' || key == 's') {
      player.stop();
    } else if (key == 'D' || key == 'd') {
      player.stop();
    }
  }
}


/************************************************************************
 *                         getPokemon FUNCTION
 *  
 *  This function returns which pokemon you are closest to within a
 *  pixel buffer.
 *
 ***********************************************************************/
Sprite getPokemon() {
  player.stop();
  Sprite pokemonAtPlayer = null;
  int x = player.x;
  int y = player.y;
  int buffer = 15;

  for (int i = 0; i < pokemon.length; i++) {
    if (x+64+buffer > pokemon[i].x && x-buffer < pokemon[i].x+64) {
      if (y+64+buffer > pokemon[i].y && y-buffer < pokemon[i].y+64) {
        pokemonAtPlayer = pokemon[i];
      }
    }
  }

  return pokemonAtPlayer;
}


void displayWarnings() {
  textAlign(CENTER, BOTTOM);
  text(warningMessage, 0, 0, width, height-20);
  if (timer()) {
    warningMessage = "";
  }
}

boolean timer() {
  if (time < 90) {
    return false;
  } else {
    time = 0;
    return true;
  }
}