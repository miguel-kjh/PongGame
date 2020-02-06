public class Ball {
    private float posX,posY;
    private int dimension;
    private float speedX,speedY;

    public Ball(float posX, float posY, int dimension, float speedX, float speedY) {
        this.posX = posX;
        this.posY = posY;
        this.dimension = dimension;
        this.speedX = speedX;
        this.speedY = speedY;
    }

    public void moveX(){
        posX += speedX;
    }

    public void moveY(){
        posY += speedY;
    }

    public void setPosX(float posX) {
        this.posX = posX;
    }

    public void setPosY(float posY) {
        this.posY = posY;
    }

    public float getPosX() {
        return posX;
    }

    public float getPosY() {
        return posY;
    }

    public int getDimension() {
        return dimension;
    }

    public float getSpeedX() {
        return speedX;
    }

    public void setSpeed(float speedX, float speedY) {
        this.speedX = speedX;
        this.speedY = speedY;
    }

    public void changeDirectionY() {
        speedY = -speedY;
    }

    public void changeDirectionX() {
        speedX = -speedX;
    }
}
