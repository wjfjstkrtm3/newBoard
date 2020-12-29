import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class Main {

	public static void main(String[] args) throws Exception {
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		StringBuilder sb = new StringBuilder();
		String aa = "aaaa";
		char str = aa.charAt(0);
		System.out.println(str);
		
		while(true) {
			StringTokenizer st = new StringTokenizer(br.readLine(), " ");
			int a = Integer.parseInt(st.nextToken());
			int b = Integer.parseInt(st.nextToken());
			
			sb.append(a+b).append("\n");
			if(a == 0 && b == 0) {
				break;
			}
		}
		
		br.close();
		System.out.println(sb);
		
	}	
	
}