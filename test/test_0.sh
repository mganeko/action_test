#!/bin/sh


# --- func

DiffStdout() {
  diff --strip-trailing-cr temp/result.txt temp/expect.txt > temp/diff.txt
}

CheckStdout() {
  if [ -s diff.txt ]
  then
    echo "ERROR!"
    cat diff.txt
    exit 1
  else
    echo "OK"
  fi
}

# --- sum 1, 2, 3, 4, 5 == 15 ---

echo "-- TEST:　sum 1 2 3 4 5 ===> 15 --"
node ../sum.js 1 2 3 4 5 > temp/result.txt
echo "15" > temp/expect.txt
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
node ../sum.js a b c  > temp/result.txt
exitcode=$?
#echo $exitcode

# expect error eexit
if [ $exitcode -eq 0 ]
then
  echo "OK: exit code == 1"
else
  echo "ERROR! exit code !== 1"
  exit 2
fi

#-----
echo "--- ALL TEST PASS ----"
exit 0