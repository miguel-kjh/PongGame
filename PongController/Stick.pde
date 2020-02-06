public class Stick {
    private int posX,posY;
    private int stickWidth, stickHeight;

    public Stick(int posX, int posY, int stickWidth, int stickHeight) {
        this.posX = posX;
        this.posY = posY;
        this.stickWidth = stickWidth;
        this.stickHeight = stickHeight;
    }

    public void setPosY(int posY) {
        this.posY = posY;
    }

    public int getPosX() {
        return posX;
    }

    public int getPosY() {
        return posY;
    }

    public int getStickWidth() {
        return stickWidth;
    }

    public int getStickHeight() {
        return stickHeight;
    }


    public void moveUp(int amountPixel) {
        posY -= amountPixel;
    }

    public void moveDown(int amountPixel) {
        posY += amountPixel;
    }
}
