// PokeDude
// CodeMakers Advanced
// Andrew B

Sprite p;
PImage pImg;
Sprite battle;
Sprite[] pokemon;
PImage[] pokeImg;

void setup() {
  size(600, 600);
  pImg = loadImage("Sprites/Player.png");
  p = new Sprite(25, 300, pImg, 100);

  // Setup all the pokemon and their images.
  pokemon = new Sprite[13];
  pokeImg = new PImage[13];
  for (int i = 0; i < 10; i++) {
    pokeImg[i] = loadImage("Sprites/Pokemon0"+i+".png");
  }
  for (int i = 0; i < 3; i++) {
    pokeImg[i+10] = loadImage("Sprites/Pokemon2"+i+".gif");
  }
  for (int i = 0; i < 13; i++) {
    pokemon[i] = new Sprite(400, 300, pokeImg[i], 100);
  }
  battle = pokemon[0];
}

void draw() {
  background(130, 200, 150); // Poke Green
  p.draw();
  battle.draw();
}

void keyPressed() {
  if (key == 'a') {
    p.moveLeft();
  } else if (key == 'd') {
    p.moveRight();
  } else if (key == 'w') {
    p.moveUp();
  } else if (key == 's') {
    battle.setHealth(battle.getDefense() - p.getAttack());
  } else if (key == 'B') {
    newBattle();
  } else if (key == 'Q') {
    exit();
  }
}

void newBattle() {
  int r = int(random(pokemon.length));
  battle = pokemon[r];
}