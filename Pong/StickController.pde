public class StickController {
    private boolean downLeft,upLeft;
    private boolean downRight, upRight;
    private Stick stickRight;
    private Stick stickLeft;

    public StickController(int posXRight,int posYLeft, int posY, int stickWidth, int stickHeigth) {
        this.stickRight = new Stick(posXRight,posY,stickWidth,stickHeigth);
        this.stickLeft = new Stick(posYLeft,posY,stickWidth,stickHeigth);
    }

    public Stick getStickRight() {
        return stickRight;
    }

    public Stick getStickLeft() {
        return stickLeft;
    }

    public void setDownLeft(Boolean downLeft) {
        this.downLeft = downLeft;
    }

    public void setUpLeft(Boolean upLeft) {
        this.upLeft = upLeft;
    }

    public void setDownRight(Boolean downRight) {
        this.downRight = downRight;
    }

    public void setUpRight(Boolean upRight) {
        this.upRight = upRight;
    }

    public void moveSticks(){
        int amountPixels = 12;
        if (upLeft){
            stickLeft.moveUp(amountPixels);
        }
        if (downLeft){
            stickLeft.moveDown(amountPixels);
        }
        if (upRight){
            stickRight.moveUp(amountPixels);
        }
        if (downRight){
            stickRight.moveDown(amountPixels);
        }
    }

    public void constrainPosition(int height){
        if (stickLeft.getPosY() >= height-stickLeft.getStickHeight()){
            stickLeft.setPosY(height-stickLeft.getStickHeight());
        }
        if (stickLeft.getPosY() <= 0){
            stickLeft.setPosY(0);
        }
        if (stickRight.getPosY() >= height-stickRight.getStickHeight()){
            stickRight.setPosY(height-stickRight.getStickHeight());
        }
        if (stickRight.getPosY() <= 0){
            stickRight.setPosY(0);
        }
    }


}
