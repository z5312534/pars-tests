# test a large number of jobs

in=$(cat <<EOF
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
sleep 5; echo 1
echo 2
echo 2
EOF
)

expected=$(cat <<EOF
2
2
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
EOF
)

out=$("$pars" -J 32 <<<"$in")

if diff -q <(echo "$expected") <(echo "$out") >/dev/null 2>&1; then
	echo -e "$0 \033[0;32m passed\033[0;0m"
else
	echo -e "$0 \033[0;31m failed\033[0;0m"
	echo "$out" >"$0.out"
	echo "$expected" >"$0.expected"
fi
