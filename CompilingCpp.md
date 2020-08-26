# haxe c++ 向けコンパイルライブラリの使い方
haxeのcookbookはここ↓  
"https://code.haxe.org/category/other/compiling-cpp-code-windows-mingw.html" 

cookbookの通りだと、haxelibのminimingwが古すぎて環境を合わせるのが面倒。

## 手順
・haxeとmingwはインストール済みの前提  
・対象はwindowsでmingwを使う場合←公式でもVS使ったほうがって書いてある

### minimingwをbuild
成功すればMinGWフォルダができているはず
1. giit clone https://github.com/nmehost/minimingw.git
2. BuildDistro.hx の中の2か所を編集
```haxe:BuildDistro.hx
var mingwSrc = "C:/mingw64"; //install path  
var mingwVersion = "8.1.0"; //gcc --version 
```
3. files.txtを```dir/b > files.txt```やらなんやらで編集
```txt:files.txt
bin/addr2line.exe
bin/ar.exe
bin/as.exe
etc..
```
4. haxeでbuild
```
haxe compile.hxml
```
5. nekoで実装  
```neko BuildDistro.n```
6. haxelibに登録
```haxelib dev ~/minimingw-master/MinGW```

### haxeのプロジェクト側で、build.hxmlを編集
```hxml:build.hxml
-m Main
-cpp bin/
~~-D toolchain=mingw~~
-D HXCPP_MINGW
-D HXCPP_M64
```

以上でいけるはず

### 補足
依存関係のhxcppの中身も参考になる
~/haxlib/hxcpp/{version}/toolchain/mingw-toolchain.xml


