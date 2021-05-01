/*
Welcome to No Rhythm Required. As the title suggests, you don't need any rhythm
to play, just some good hand-eye coordination. Hit the arrow keys as the notes reach
the blocks at the bottom of the screen to score points before the song reaches its
end. Also the higher your score, the animation to the side will be different.
Have fun and bop along to music while getting a high score!
 */
import processing.sound.*;
SoundFile backgroundSound;

ArrayList<Block> redBlockList;
ArrayList<Block> greenBlockList;
ArrayList<Block> blueBlockList;
ArrayList<Block> yellowBlockList;

ArrayList<Note> redNoteList;
ArrayList<Note> greenNoteList;
ArrayList<Note> blueNoteList;
ArrayList<Note> yellowNoteList;

Animation plainSpin;
PImage[] spinImages = new PImage[7];

Animation blink;
PImage[] blinkImages = new PImage[5];

Animation headBob;
PImage[] bobImages = new PImage[2];

Animation blueRave;
PImage[] blueImages = new PImage[5];

Animation yellowRave;
PImage[] yellowImages = new PImage[5];

Animation redRave;
PImage[] redImages = new PImage[7];

Animation victory;
PImage[] victoryImages = new PImage[2];

int switchVal;
int playerScore;

//Timer vars
int startTime1;
int endTime1;
int interval1;

int startTime2;
int endTime2;
int interval2;

int startTime3;
int endTime3;
int interval3;

int startTime4;
int endTime4;
int interval4;

void setup() {
  size(900, 800);
  rectMode(CENTER);
  textAlign(CENTER);

  backgroundSound = new SoundFile(this, "KoiNoDiscoQueen.wav");
  backgroundSound.amp(0.6);

  redBlockList = new ArrayList<Block>();
  redBlockList.add(new Block(550, height- 150, color(255, 0, 0)));
  greenBlockList = new ArrayList<Block>();
  greenBlockList.add(new Block(650, height- 150, color(0, 255, 0)));
  blueBlockList = new ArrayList<Block>();
  blueBlockList.add(new Block(750, height- 150, color(0, 0, 255)));
  yellowBlockList = new ArrayList<Block>();
  yellowBlockList.add(new Block(850, height- 150, color(255, 255, 0)));

  redNoteList = new ArrayList<Note>();
  redNoteList.add(new Note(550, 0, color(255, 0, 0)));
  greenNoteList = new ArrayList<Note>();
  greenNoteList.add(new Note(650, 0, color(0, 255, 0)));
  blueNoteList = new ArrayList<Note>();
  blueNoteList.add(new Note(750, 0, color(0, 0, 255)));
  yellowNoteList = new ArrayList<Note>();
  yellowNoteList.add(new Note(850, 0, color(255, 255, 0)));

  for (int i = 0; i < spinImages.length; i++){
    spinImages[i] = loadImage("DancerSpin"+i+".png");
  }
  plainSpin = new Animation(spinImages, 0.1, 1);
  
  for (int i = 0; i < blinkImages.length; i++){
    blinkImages[i] = loadImage("DancerBlink"+i+".png");
  }
  blink = new Animation(blinkImages, 0.1, 1);
  
  for (int i = 0; i < bobImages.length; i++){
    bobImages[i] = loadImage("DancerBob"+i+".png");
  }
  headBob = new Animation(bobImages, 0.1, 1);
  
  for (int i = 0; i < blueImages.length; i++){
    blueImages[i] = loadImage("DancerBlue"+i+".png");
  }
  blueRave = new Animation(blueImages, 0.1, 1);
  
  for (int i = 0; i < yellowImages.length; i++){
    yellowImages[i] = loadImage("DancerYellow"+i+".png");
  }
  yellowRave = new Animation(yellowImages, 0.1, 1);
  
  for (int i = 0; i < redImages.length; i++){
    redImages[i] = loadImage("DancerRed"+i+".png");
  }
  redRave = new Animation(redImages, 0.1, 1);
  
  for (int i = 0; i < victoryImages.length; i++){
    victoryImages[i] = loadImage("DancerVictory"+i+".png");
  }
  victory = new Animation(victoryImages, 0.1, 1);

  switchVal = 0;
  playerScore = 0;

  //Timer values
  startTime1 = millis();
  interval1 = 2000;

  startTime2 = millis();
  interval2 = 4500;

  startTime3 = millis();
  interval3 = 3500;

  startTime4 = millis();
  interval4 = 5000;
}


void draw() {
  background(0);

  switch(switchVal) {
  case 0:
    textSize(75);
    fill(255, 255, 255);
    text("No Rhythm Required", 475, 150);
    text("Press 'space' to play", 475, height/2 + 275);
    plainSpin.display(475, height/2);
    plainSpin.isAnimating = true;
    break;
  case 1:


    endTime1 = millis();
    endTime2 = millis();
    endTime3 = millis();
    endTime4 = millis();

    if (endTime1 - startTime1 >= interval1) {
      redNoteList.add(new Note(550, 0, color(255, 0, 0)));
      startTime1 = millis();
    }

    if (endTime2 - startTime2 >= interval2) {
      greenNoteList.add(new Note(650, 0, color(0, 255, 0)));
      startTime2 = millis();
    }

    if (endTime3 - startTime3 >= interval3) {
      blueNoteList.add(new Note(750, 0, color(0, 0, 255)));
      startTime3 = millis();
    }

    if (endTime4 - startTime4 >= interval4) {
      yellowNoteList.add(new Note(850, 0, color(255, 255, 0)));
      startTime4 = millis();
    }

    for (Block B1 : redBlockList) {
      B1.render();
      B1.resetBounds();
    }

    for (Note N1 : redNoteList) {
      N1.render(); 
      N1.move();
      N1.resetBounds();
      //println(N1.y);
    }

    for (Block B2 : greenBlockList) {
      B2.render();
      B2.resetBounds();
    }

    for (Note N2 : greenNoteList) {
      N2.render(); 
      N2.move();
      N2.resetBounds();
    }

    for (Block B3 : blueBlockList) {
      B3.render();
      B3.resetBounds();
    }

    for (Note N3 : blueNoteList) {
      N3.render(); 
      N3.move();
      N3.resetBounds();
    }

    for (Block B4 : yellowBlockList) {
      B4.render();
      B4.resetBounds();
    }

    for (Note N4 : yellowNoteList) {
      N4.render(); 
      N4.move();
      N4.resetBounds();
    }
    
    if(playerScore >= 0 && playerScore <= 600){
      blink.display(250, 300);
      blink.isAnimating = true;
      headBob.isAnimating = false;
      plainSpin.isAnimating = false;
      blueRave.isAnimating = false;
      yellowRave.isAnimating = false;
      redRave.isAnimating = false;
    }
    if(playerScore >= 600 && playerScore <= 1200){
      headBob.display(250, 300);
      headBob.isAnimating = true;
      blink.isAnimating = false;
      plainSpin.isAnimating = false;
      blueRave.isAnimating = false;
      yellowRave.isAnimating = false;
      redRave.isAnimating = false;
    }
    if(playerScore >= 1200 && playerScore <= 1800){
      plainSpin.display(250, 300);
      plainSpin.isAnimating = true;
      headBob.isAnimating = false;
      blink.isAnimating = false;
      blueRave.isAnimating = false;
      yellowRave.isAnimating = false;
      redRave.isAnimating = false;
    }
    if(playerScore >= 1800 && playerScore <= 2400){
      blueRave.display(250, 300);
      blueRave.isAnimating = true;
      headBob.isAnimating = false;
      plainSpin.isAnimating = false;
      blink.isAnimating = false;
      yellowRave.isAnimating = false;
      redRave.isAnimating = false;
    }
    if(playerScore >= 2400 && playerScore <= 3000){
      yellowRave.display(250, 300);
      yellowRave.isAnimating = true;
      headBob.isAnimating = false;
      plainSpin.isAnimating = false;
      blueRave.isAnimating = false;
      blink.isAnimating = false;
      redRave.isAnimating = false;
    }
    if(playerScore >= 1500 && playerScore <= 1800){
      redRave.display(250, 300);
      redRave.isAnimating = true;
      headBob.isAnimating = false;
      plainSpin.isAnimating = false;
      blueRave.isAnimating = false;
      yellowRave.isAnimating = false;
      blink.isAnimating = false;
    }
    
    textSize(60);
    fill(255);
    text("Score: ", 100, height- 150);
    text(playerScore, 350, height- 150);
    textSize(25);
    fill(0);
    text("Up", 550, height- 145);
    text("Down", 650, height- 145);
    text("Left", 750, height- 145);
    text("Right", 850, height- 145);

    if(!backgroundSound.isPlaying()){
     switchVal = 2; 
    }

    break;
  case 2 :
    textSize(75);
    fill(255);
    text("Highscore: ", 250, height - 250);
    text(playerScore, width/2 + 200, height - 250);
    //println(playerScore);
    textSize(65);
    text("Press 'space' to play again", width/2, height-100);
    victory.display(width/2, 250);
    victory.isAnimating = true;
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      for (Block b : redBlockList) {
        for (Note n : redNoteList) {
          n.resetBounds();
          n.isHit(b);
        }

        for (int i = redNoteList.size()-1; i>=0; i--) {
          if (redNoteList.get(i).isDead == true) {
            redNoteList.remove(i);
            playerScore += 20;
            //println(playerScore);
            println("red note hit");
          }
        }
      }
    }

    if (keyCode == DOWN) {
      for (Block b1 : greenBlockList) {
        for (Note n1 : greenNoteList) {
          n1.resetBounds();
          n1.isHit(b1);
        }

        for (int i = greenNoteList.size()-1; i>=0; i--) {
          if (greenNoteList.get(i).isDead == true) {
            greenNoteList.remove(i);
            playerScore += 20;
            //println(playerScore);
            println("green note hit");
          }
        }
      }
    }

    if (keyCode == LEFT) {
      for (Block b2 : blueBlockList) {
        for (Note n2 : blueNoteList) {
          n2.resetBounds();
          n2.isHit(b2);
        }

        for (int i = blueNoteList.size()-1; i>=0; i--) {
          if (blueNoteList.get(i).isDead == true) {
            blueNoteList.remove(i);
            playerScore += 20;
            //println(playerScore);
            println("blue note hit");
          }
        }
      }
    }

    if (keyCode == RIGHT) {
      for (Block b3 : yellowBlockList) {
        for (Note n3 : yellowNoteList) {
          n3.resetBounds();
          n3.isHit(b3);
        }

        for (int i = yellowNoteList.size()-1; i>=0; i--) {
          if (yellowNoteList.get(i).isDead == true) {
            yellowNoteList.remove(i);
            playerScore += 20;
            //println(playerScore);
            println("yellow note hit");
          }
        }
      }
    }
  }
  if (key == ' ') {
    switchVal = 1;
    if (backgroundSound.isPlaying()){
      backgroundSound.stop();
    }
    backgroundSound.play();
    reset();
  }
}

void reset(){
  playerScore = 0;
}
