int rows=4; //number of rows in squareGrid 2D array
int columns=4; //number of columns in squareGrid 2D array
int size=100; //size of the squares
int greenSquareX,greenSquareY; //x and y coordinates for the green square
int pressedX,pressedY; //x and y coodinates to store mouseX and mouse Y when clicked
int score; //score of the player
color white=255; //white colour
color red=#FF0000; //red colour
color green=#03FF1D; //green colour
boolean squareGreen; //boolean to turn a square to green

int[][] squareGrid = new int[columns][rows]; //2D array for the grid of squares

void setup() {
  size(400,400); //size of the run window
  greenSquareSetup(); //sets up the coordinates of the green square
}

void draw() {
  squares(); //creates a grid of squares
  greenSquare(); //turns a square green when clicked, if it is the correct square
  redSquares(); //turns squares red when clicked, if it is not the correct square
  playerScore(); //displays the player's score in the top left corner
  win(); //ends the game when the green square is clicked
}

void squares() {
  for(int index1=0;index1<squareGrid.length;index1++) { //index1 variable has an initial value of 0, must be less than the length of squareGrid array, and increases by increments of 1
    for(int index2=0;index2<squareGrid[0].length;index2++) { //index2 variable has an initial value of 0, must be less than the length of squareGrid[0] array, and increases by increments of 1
      if(squareGrid[index1][index2]==0) { //if a number in squareGrid array is equal to 0
      fill(white); //white fill colour for squares
      square(index1*size,index2*size,size); //creates white squares
      }
    }
  }
}

void redSquares() {
  for(int index1=0;index1<squareGrid.length;index1++) { //index1 variable has an initial value of 0, must be less than the length of squareGrid array, and increases by increments of 1
    for (int index2=0;index2<squareGrid[0].length;index2++) { //index2 variable has an initial value of 0, must be less than the length of squareGrid[0] array, and increases by increments of 1
      if(squareGrid[index1][index2]==2) { //if a number in squareGrid array is equal to 2
        fill(red); //red fill colour for squares
        square(index1*size,index2*size,size); //creates red squares
      }
    }
  }
}

void greenSquareSetup() {
  greenSquareX=int(random(rows)); //randomizes x-coordinate of the green square
  greenSquareY=int(random(columns)); //randomizes y-coordinate of the green square
  squareGrid[greenSquareX][greenSquareY]=1; //green square in squareGrid array is equal to 1
}
  
void greenSquare() {
  for(int index1=0;index1<squareGrid.length;index1++) { //index1 variable has an initial value of 0, must be less than the length of squareGrid array, and increases by increments of 1
    for(int index2=0;index2<squareGrid[0].length;index2++) { //index2 variable has an initial value of 0, must be less than the length of squareGrid[0] array, and increases by increments of 1
      if(squareGrid[index1][index2]==1 && squareGreen) {  //if a number in squareGrid array is equal to 1 and squareGreen is true
        fill(green); //green fill colour for squares
        square(index1*size,index2*size,size); //creates a green square
      }
      else {
        fill(white); //white fill colour for square
        square(index1*size,index2*size,size); //creates a white square
      }
    }
  }
}

void playerScore() {
  fill(0); //black fill colour for text
  textSize(30); //text size of 30
  text("SCORE:",10,30); //text that says, "SCORE:"
  text(score,110,30); //text that displays the player's score
}

void win() {
  if(squareGreen) { //if a square is green
    textSize(70); //text size of 70
    text("YOU WIN",75,height/2); //text that says, "YOU WIN"
  }
}

void mousePressed() {
  if(squareGreen==false) { //if a square is not green
    pressedX=mouseX/100; //stores x-coordinate of where the mouse is pressed divided by 100
    pressedY=mouseY/100; //stores y-coordinate of where the mouse is pressed divided by 100
    if(squareGrid[pressedX][pressedY]==0) { //if a number in squareGrid array that is equal to 0 is pressed
      squareGrid[pressedX][pressedY]=2; //the number in squareGrid array is equal to 2
      score++; //player score increases by 1
    }
    if(squareGrid[pressedX][pressedY]==1) { //if a number in squareGrid array that is equal to 1 is pressed
      squareGreen=true; //a square is green
      score++; //player score increases by 1
    }
  }
}
