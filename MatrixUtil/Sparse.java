/**
 * 
 */
package MatrixUtil;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Zhong
 *
 */
public class Sparse {

	Map<int[], Float> mat;

	public Sparse(int[][] index, float[] value) {
		this.mat = new HashMap<int[], Float>();
		if (value != null) {
			for (int i = 0; i < value.length; i++) {
				mat.put(index[i], value[i]);
			}
		}
	}

}
