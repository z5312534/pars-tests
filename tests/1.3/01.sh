# lazy mode: existing lines should finish, new lines should not start

in=$(cat <<EOF
sleep 1; echo 4; echo 5
echo 1; echo 2; echo 3
false
echo 1
EOF
)

expected=$(cat <<EOF
1
2
3
4
5
EOF
)

out=$("$pars" -J 2 -e lazy <<<"$in")

if diff -q <(echo "$expected") <(echo "$out") >/dev/null 2>&1; then
	echo -e "$0 \033[0;32m passed\033[0;0m"
else
	echo -e "$0 \033[0;31m failed\033[0;0m"
	echo "$out" >"$0.out"
	echo "$expected" >"$0.expected"
fi
