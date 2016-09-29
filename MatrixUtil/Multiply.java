/**
 * 
 */
package MatrixUtil;

import java.util.Iterator;

/**
 * @author Zhong
 *
 */
public class Multiply {

	Sparse product;

	public Multiply(Sparse left, Sparse right) {
		this.product = new Sparse(null, null);
		Iterator<int[]> leftiter = left.mat.keySet().iterator();
		while (leftiter.hasNext()) {
			int[] leftkey = leftiter.next();
			int leftrow = leftkey[0];
			int leftcol = leftkey[1];
			float x = left.mat.get(leftkey);
			Iterator<int[]> rightiter = right.mat.keySet().iterator();
			while (rightiter.hasNext()) {
				int[] rightkey = rightiter.next();
				int rightrow = rightkey[0];
				int rightcol = rightkey[1];
				float y = right.mat.get(rightkey);
				if (leftcol == rightrow) {
					int[] index = new int[2];
					index[0] = leftrow;
					index[1] = rightcol;
					float value = x * y;
					if (this.product.mat.containsKey(index)) {
						float origin = this.product.mat.get(index);
						this.product.mat.put(index, origin + value);
					}
					if (!this.product.mat.containsKey(index)) {
						this.product.mat.put(index, value);
					}
				}
			}
		}
	}
}
