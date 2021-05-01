class Block {
  int x;
  int y;
  int w;
  color blockColor;
  int topBound;      //top of the block hitbox
  int bottomBound;   //bottom of the block hitbox
  int leftBound;     //left of the block hitbox
  int rightBound;    //right of the block hitbox
  boolean isDead;

  //Constructor
  Block(int bX, int bY, color bColor) {
    x = bX;
    y = bY;
    w = 75;
    blockColor = bColor;
    topBound = y - w/2;
    bottomBound = y + w/2;
    leftBound = x - w/2;
    rightBound = x + w/2;
    isDead = false;
  }

  //Functions

  //makes the blocks that represent the arrow keys
  void render() {
    fill(blockColor);
    square(x, y, w);
  }

  ////determines if the bullet has hit the enemy
  //void isHit(Note aNote) {
  //  //if (aBlock.rightBound >= leftBound && aBlock.leftBound <= rightBound) {
  //    if (isBetween(y, aNote.topBound, aNote.y)) {
  //      isDead = true;
  //      //println("up key hit");
  //    //}
  //  } else {
  //    println("note missed");
  //  }
  //}

  //updates the hitbox of the blocks as more are added
  void resetBounds() {
    topBound = y - w/2;
    bottomBound = y + w/2;
    leftBound = x - w/2;
    rightBound = x + w/2;
    //println(rightBound);
  }
}
