import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.util.StringTokenizer;

public class Main {

	public static void main(String[] args) throws IOException {
		// 택시 기하학
		
		// 택시 기하학의 원은 정사각형이 나오는데
		// 정사각형 넓이 공식 = 한 변의 길이 * 한 변의 길이
		// 여기서는 한 변의 길이를 알 수 없으므로 주어진 반지름을 통해 해결해야한다
		// 지름 = 대각선의 길이
		// 정사각형의 대각선의 길이 = 루트2 * 한 변의 길이
		// a를 한변의 길이라고 생각하면
		// 2r = 루트2 * a
		// 4r제곱 = 2 * a제곱
		// 2r제곱 = a제곱          --> a제곱이 결국  = 한 변의 길이 * 한 변의 길이
		
		// 2r제곱이 결국 넓이가 되겠다
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		StringBuilder sb = new StringBuilder();
		
		double N = Double.parseDouble(br.readLine());
		
		System.out.println(String.format("%.6f", Math.PI*N*N));
		System.out.println(String.format("%.6f", 2*N*N));
	}

}