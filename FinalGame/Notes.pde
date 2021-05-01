class Note {
  int x;
  int y;
  int w;
  int ySpeed;
  color noteColor;
  int topBound;      //top of the enemy hitbox
  int bottomBound;   //bottom of the enemy hitbox
  int leftBound;     //left of the enemy hitbox
  int rightBound;    //right of the enemy hitbox
  boolean isDead;    //if true, the enemy is now dead and will be removed


  //Constructor
  Note(int nX, int nY, color nColor) {
    x = nX;
    y = nY;
    w = 65;
    ySpeed = 10;
    noteColor = nColor;
    topBound = y - w/2;
    bottomBound = y + w/2;
    leftBound = x - w/2;
    rightBound = x + w/2;
    isDead = false;
  }

  //Functions

  //makes an enemy
  void render() {
    fill(noteColor);
    square(x, y, w);
  }

  //increases the y position of the note blocks in order to make them move down
  void move() {
    y += ySpeed;
  }

  ////is aVal between firstBound and secoundBound
  //boolean isBetween(int aVal, int firstBound, int secondBound) {
  //  if (aVal >= firstBound && aVal <= secondBound) {
  //    return true;
  //  } else {
  //    return false;
  //  }
  //}

  //determines if the bullet has hit the enemy
  void isHit(Block aBlock) {
    //if (aBlock.rightBound >= leftBound && aBlock.leftBound <= rightBound) {
      if (aBlock.topBound <= bottomBound && aBlock.bottomBound >= y) {
        isDead = true;
        //println("key hit");
      //}
    } else {
      println("note missed");
    }
  }

  //makes it so the hitbox of the note block updates as it moves
  void resetBounds() {
    topBound = y - w/2;
    bottomBound = y + w/2;
    leftBound = x - w/2;
    rightBound = x + w/2;
    //println(rightBound);
  }
}
