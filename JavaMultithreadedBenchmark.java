public class HelloThread extends Thread {
    public void run(int[] array, int index) {
    	// Hello from a thread!");
    	int value = array[index]

    	for (int i = 0; i < 1000000; i++) {
    		value += 1
    	}

    	array[]
    }

    public static void main(String args[]) {
        (new HelloThread()).start();
    }

}

public class JavaBenchmark {
	public static int[] array = new int[]{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 0 };

	public static void main(String args[]) { 
        System.out.println("Hello, World"); 
        benchmark();
    } 

	public static void benchmark() {
		for (int i = 0; i < 1000000; i++) {
			for (int j = 0; j < array.length; j++) {
				array[j] += 1;
			}
		}
		System.out.print(array[0]);
	}
}