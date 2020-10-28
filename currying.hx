class Main {
	/* 部分適応とカリー化
	   カリー化を用いた部分適応は、1関数1引数でタイプ量を減らすことでバグを減らすテクニック
	   記述量は、標準の部分適応より少なくなる
           参考
	    https://qiita.com/KtheS/items/1a93ba0a6d722a534439
	    https://qiita.com/norkron/items/6b28962ac86e17750041
        */
	static function main() {
		// currying
		final add = (x) -> (y) -> x + y;
		/*
			final add = function(x) {
				return function(y) {
					return x + y;
				}
			}
		 */

		// 戻すメリットがわからないけど
		final uncurry = g -> (x, y) -> g(x)(y);
		/*
			final uncurry = function(g) {
				return function(x, y) {
					return g(x)(y);
				}
			}
		 */

		trace(add(3)(2));
		trace(uncurry(add)(2, 3));

		// usage
		final add10 = add(10);
		trace(add10(2));
		// 12
		trace(add10(5));
		// 15

		// haxe の標準機能のbind()を使用すれば同様に処理できる
		var func10:Int->Void = output.bind(10);
		var func5:Int->Void = output.bind(_, 5);

		func10(5);
		func5(10);

		// カリー化のメリットがありそうなパターン
		// 参考:http://www.nct9.ne.jp/m_hiroi/func/ocaml03.html
		final distance = (x1, y1) -> (x2, y2) -> Math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));
		final distance3d = (x1, y1, z1) -> (x2, y2, z2) -> Math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2) + (z1 - z2) * (z1 - z2));
		trace(distance(0, 0)(10, 10));
		trace(distance3d(0, 0, 0)(10, 10, 10));
	}

	static function output(a:Int, b:Int):Void {
		trace(a + b);
	}
}
