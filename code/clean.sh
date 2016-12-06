for ((i=1; i<=16; i++)); do
    sed -e "s/^M/\n/g" "Co$i" | sed -e "s/>> //g" | sed -e "/^Epoch/d" |sed -e "/^$/d" > "Co$i.clean"
done
