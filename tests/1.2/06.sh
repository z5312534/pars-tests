# test `nproc` jobs

nproc=$(nproc)

in="$(yes "sleep 5; echo 1" | head -"$((nproc-1))")
echo 2
echo 2"

expected="2
2
$(yes "1" | head -"$((nproc-1))")"

out=$("$pars" -J $nproc <<<"$in")

if diff -q <(echo "$expected") <(echo "$out") >/dev/null 2>&1; then
	echo -e "$0 \033[0;32m passed\033[0;0m"
else
	echo -e "$0 \033[0;31m failed\033[0;0m"
	echo "$out" >"$0.out"
	echo "$expected" >"$0.expected"
fi
