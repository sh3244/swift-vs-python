	


public class JavaBenchmark {
	public static int[] array = new int[]{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 0 };

	public static void main(String args[]) {
        benchmark();
    } 

	public static void benchmark() {
		for (int i = 0; i < 1000000; i++) {
			for (int j = 0; j < array.length; j++) {
				array[j] += 1;
			}
		}
		System.out.print("[");
		for (int i = 0; i < array.length - 1; i++) {
			System.out.print(array[i]);
			System.out.print(", ");
		}
		System.out.print(array[array.length - 1]);
		System.out.print("]");
	}
}