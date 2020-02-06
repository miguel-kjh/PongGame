Ball ball;
StickController stickController;
GameLog gameLog;
boolean startGame = false;
boolean pause = false;

public void settings() {
    size(500,500);
}

private float calculateSpeed(){
    int direction;
    do {
        direction = round(random(-1,1));
    } while (direction == 0);
    return direction*random(3,5);
}


public void setup() {
    noStroke();
    surface.setTitle("Pong Game");
    ball = new Ball(width/2,height/2,20,calculateSpeed(),calculateSpeed());
    stickController = new StickController((int)(width*0.9),(int)(width*0.1),height/2,10,40);
    gameLog = new GameLog();
}

public void draw() {
    background(0);
    if (startGame){
        paintBall();
        createScoreboard();
        paintLine();
        paintStick();
        if (!pause) {
            moveBall();
            controlBallPosition();
            moveStick();
            controlStickShock();
        } else {
            paintPause();
        }
    } else {
        startingScreen();
    }
}

private void paintPause() {
    textSize(50);
    text("PAUSE",width*0.35f,height/2);
}

private void paintLine() {
    stroke(255);
    int diff = 30;
    for (int i = 0; i < height; i+=diff) {
        line(width/2,i+diff, width/2, i+diff-5);
    }
    noStroke();
}

public void paintBall(){
    ellipse(ball.getPosX(),ball.getPosY(),ball.getDimension(),ball.getDimension());
}

public void startingScreen(){
    textSize(50);
    text("Pong Game", width * 0.23f,height * 0.25f);
    paintBall();
    paintStick();
    moveStick();
    textSize(15);
    text("F to start", width * 0.44f,height * 0.45f);
    text("Move the left stick with W (up) and S (down)", width * 0.16f,height * 0.65f);
    text("Move the right stick with the keyboard arrows", width * 0.16f,height * 0.75f);
    text("P pause / E end", width * 0.40f,height * 0.85f);
    text("Enjoy!!", width * 0.45f,height * 0.95f);
}

public void createScoreboard(){
    int diff = 50;
    textSize(32);
    text(gameLog.getScorePlayerLeft(),width * 0.25f, diff);
    text(gameLog.getScorePlayerRight(),width * 0.75f, diff);
}

public void paintStick(){
    Stick stickRight = stickController.getStickRight();
    rect(stickRight.getPosX(), stickRight.getPosY(), stickRight.getStickWidth(), stickRight.getStickHeight());
    Stick stickLeft = stickController.getStickLeft();
    rect(stickLeft.getPosX(),stickLeft.getPosY(), stickLeft.getStickWidth(),stickLeft.getStickHeight());
}

public void moveBall(){
    ball.moveX();
    ball.moveY();
}

public void controlBallPosition(){
    if (ball.getPosX() > width || ball.getPosX() < 0){
        if (ball.getPosX() < width/2){
            gameLog.playerLeftGol();
        } else {
            gameLog.playerRightGol();
        }
        ball.setPosX(width/2);
        ball.setPosY(height/2);
        ball.setSpeed(
                calculateSpeed(),
                calculateSpeed()
        );
    }
    if (ball.getPosY() > height || ball.getPosY() < 0){
        ball.changeDirectionY();
    }
}

public void controlStickShock(){
    Stick stickRight = stickController.getStickRight();
    Stick stickLeft = stickController.getStickLeft();
    if (ball.getSpeedX() > 0
            && stickRight.getPosY() <= ball.getPosY() + ball.getDimension()/2
            && ball.getPosY() - ball.getDimension()/2 <= stickRight.getPosY() + stickRight.getStickHeight()
            && stickRight.getPosX() <= ball.getPosX() + ball.getDimension()/2
            && ball.getPosX() - ball.getDimension()/2 <= stickRight.getPosX() + stickRight.getStickWidth() ){
        ball.changeDirectionX();
    } else if (ball.getSpeedX() < 0
            && stickLeft.getPosY() <= ball.getPosY() + ball.getDimension()/2
            && ball.getPosY() - ball.getDimension()/2 <= stickLeft.getPosY() + stickLeft.getStickHeight()
            && stickLeft.getPosX() <= ball.getPosX() + ball.getDimension()/2
            && ball.getPosX() - ball.getDimension()/2 <= stickLeft.getPosX() + stickLeft.getStickWidth() ){
        ball.changeDirectionX();
    }
}

public void moveStick(){
    stickController.moveSticks();
    stickController.constrainPosition(height);
}

public void keyPressed() {
    if (key == 'w' || key == 'W') {
        stickController.setUpLeft(true);
    }
    if (key == 's' || key == 'S') {
        stickController.setDownLeft(true);
    }
    if (key == 'f' || key == 'F'){
        startGame = true;
    }
    if (startGame && (key == 'e' || key == 'E')){
        startGame = false;
        pause = false;
        setup();
    }
    if (startGame && (key == 'p' || key == 'P')){
        pause = !pause;
    }
    if (keyCode == UP) {
        stickController.setUpRight(true);
    }
    if (keyCode == DOWN) {
        stickController.setDownRight(true);
    }
}

public void keyReleased() {
    if (key == 'w' || key == 'W') {
        stickController.setUpLeft(false);
    }
    if (key == 's' || key == 'S') {
        stickController.setDownLeft(false);
    }
    if (keyCode == UP) {
        stickController.setUpRight(false);
    }
    if (keyCode == DOWN) {
        stickController.setDownRight(false);
    }
}
