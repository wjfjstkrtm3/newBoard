import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.StringTokenizer;

public class Main {

	public static void main(String[] args) throws Exception {

		// 평균은 넘겠지
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int C = Integer.parseInt(br.readLine());
		
		for(int i = 0; i < C; i++) {
			StringTokenizer st = new StringTokenizer(br.readLine(), " ");
			int personCount = Integer.parseInt(st.nextToken());
			int[] score = new int[personCount];
			double avg = 0.0;
			double sum = 0.0;
			for(int j = 0; j < personCount; j++) {
				score[j] = Integer.parseInt(st.nextToken());
				sum += score[j];
			}
			
			avg = sum / personCount;
			
			double count = 0;
			
			for(int z = 0; z < personCount; z++) {
				if(avg < score[z]) {
					count++;
				}
			}
			
			System.out.printf("%.3f%%\n",(count/personCount)*100);
			
		}
		
		
		
		
	}	
	
}