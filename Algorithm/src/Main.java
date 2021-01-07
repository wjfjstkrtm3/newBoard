import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.util.StringTokenizer;

public class Main {

	public static void main(String[] args) throws IOException {
		// 소인수 분해
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		StringBuilder sb = new StringBuilder();
		int N = Integer.parseInt(br.readLine());
	
		// 소인수 분해
		
		// ex) 72	--> 2 2 2 3 3
		
		for(int i = 2; i <= Math.sqrt(N); i++) {
			
			while(N % i == 0) {
				N = N / i;
				sb.append(i).append("\n");
			}
			
		}
		
		if(N != 1) {
			sb.append(N);
		}
		System.out.println(sb);
	}

}