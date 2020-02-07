public class GameLog {
    private int scorePlayerLeft;
    private int scorePlayerRight;
    private final int max = 10;

    public GameLog() {
        scorePlayerLeft = 0;
        scorePlayerRight = 0;
    }

    public void playerLeftGol(){
        scorePlayerLeft++;
    }

    public void playerRightGol(){
        scorePlayerRight++;
    }

    public int getScorePlayerLeft() {
        return scorePlayerLeft;
    }

    public int getScorePlayerRight() {
        return scorePlayerRight;
    }
    
    public int getMax(){
      return max;
    }
    
    public boolean hasWinner(){
      return scorePlayerLeft == max || scorePlayerRight == max;
    }
}
