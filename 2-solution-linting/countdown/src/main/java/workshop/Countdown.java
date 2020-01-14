package workshop;

public class Countdown {

    public static void main(String[] args) {
        for (int i = 20; i >= 0; i--) {
            System.out.println(i);
            if (i > 0) {
                try {
                    Thread.sleep(1000);
                } catch(InterruptedException ex) {
                }
            }
        }
    }
}
