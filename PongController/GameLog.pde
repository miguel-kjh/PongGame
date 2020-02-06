public class GameLog {
    private int scorePlayerLeft;
    private int scorePlayerRight;

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
}
