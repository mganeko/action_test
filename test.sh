#!/bin/sh

temp_dir=test/temp


# --- func

DiffStdout() {
  diff --strip-trailing-cr $temp_dir/result.txt $temp_dir/expect.txt > $temp_dir/diff.txt
}

CheckStdout() {
  if [ -s $temp_dir/diff.txt ]
  then
    echo "ERROR! stdout Different"
    cat $temp_dir/diff.txt
    exit 1
  else
    echo "OK"
  fi
}

# --- sum 1, 2, 3, 4, 5 == 15 ---

echo "-- TEST:　sum 1 2 3 4 5 ===> 15 --"
node sum.js 1 2 3 4 5 > $temp_dir/result.txt
echo "15" > $temp_dir/expect.txt
exitcode=$?
DiffStdout
CheckStdout

if [ $exitcode -eq 0 ]
then
  echo "OK: exit code == 0"
else
  echo "ERROR! exit code !== 0"
  exit 1
fi

#----- check not number ---

echo "-- TEST:　sum a b c ===> ERROR --"
node sum.js a b c  > $temp_dir/result.txt
exitcode=$?
#echo $exitcode

# expect error exit
if [ $exitcode -eq 1 ]
then
  echo "OK: exit code == 1"
else
  echo "ERROR! exit code !== 1"
  exit 2
fi

#-----
echo "--- ALL TEST PASS ----"
exit 0