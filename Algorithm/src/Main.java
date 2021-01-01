import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.StringTokenizer;

public class Main {

	public static void main(String[] args) throws Exception {

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int N = Integer.parseInt(br.readLine());
		
		int han = hanCount(N);
		
		System.out.println(han);
	}
	
	public static int hanCount(int N) {
				// 1 ~ 99 까지는 등차수열 한수의 개수는 99개
				// 100부터는 한수의 개수는 최소 99개이고, 각 자리수를 하나씩 구한다 (백의 자리, 십의 자리, 일의 자리)
				// 1000은 한수가 아니므로 예외처리를 해줌
				
				int han = 0;
				
				if(N < 100) {
					han = N;
					
				} else { // N이 100이상이면
					
					if(N == 1000) { // N이 1000일때 예외처리
						N = 999;
					}
					
					han = 99;
					for(int i = 100; i <= N; i++) {
						int hun = i / 100; // 211 / 100 = 2
						int ten = (i / 10)%10; // (211 / 10)%10 = 1
						int one = i % 10; // 211 % 10 = 1
						
						// 공차가 같으면 등차수열임
						if((hun-ten) == (ten-one)) { // 123  -> (1-2) == (2-3)
							han++;
						}
					}
				}
				
				
				
			return han;
	}
	
}