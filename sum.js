"use strict"

//
// 引数で与えられた数値の合計を計算し、標準出力に返す
// 終了コード： 0 ...  全ての引数が数値
// 終了コード： 1 ... 引数に数値以外が指定された


let sum = 0;
for (let i = 2; i < process.argv.length; i++) {
  const arg = process.argv[i];
  if (isNaN(arg)) {
    console.error('ERROR: %s is NOT Number', arg);
    process.exit(1);
  }

  //sum += arg; // error
  sum += Number(arg); // OK
}
console.log('%d', sum);

process.exit(0);
