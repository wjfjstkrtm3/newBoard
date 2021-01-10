import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.util.StringTokenizer;

public class Main {

	public static void main(String[] args) throws IOException {
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		StringBuilder sb = new StringBuilder();
		
		int T = Integer.parseInt(br.readLine());
		
		while(T-- > 0) {
			StringTokenizer st = new StringTokenizer(br.readLine(), " ");
			int x1 = Integer.parseInt(st.nextToken());
			int y1 = Integer.parseInt(st.nextToken());
			int r1 = Integer.parseInt(st.nextToken());
			
			int x2 = Integer.parseInt(st.nextToken());
			int y2 = Integer.parseInt(st.nextToken());
			int r2 = Integer.parseInt(st.nextToken());
			
			// 두 점 사이의 거리
			// 피타고라스 정리 : 루트(x2-x1)제곱 + (y2-y1)제곱
			
			int distance = (int)(Math.pow(x2-x1, 2) + Math.pow(y2-y1, 2));
			
			// 1. 중점이 같으면서 반지름도 같은 경우 (완전히 포개지는 경우)
			if(x1 == x2 && y1 == y2 && r1 == r2) {
				sb.append(-1).append("\n");;
			}     
			
			// 2-1. 두 원의 반지름 합보다 중점간 거리가 더 길때
			else if(distance > Math.pow(r1+r2, 2)) {
				sb.append(0).append("\n");;
			}
			
			// 2-2. 원 안에 있으나 내접하지 않을때
			else if(distance < Math.pow(r2-r1, 2)) {
				sb.append(0).append("\n");;
			}
			
			// 3-1. 내접할 때
			else if(distance == Math.pow(r2-r1, 2)) {
				sb.append(1).append("\n");;
			}
			
			// 3-2. 외접할 때
			else if(distance == Math.pow(r1+r2, 2)) {
				sb.append(1).append("\n");;
			}
			
			else {
				sb.append(2).append("\n");
			}
		}
		
		System.out.println(sb);
		br.close();
		
		
	}

}