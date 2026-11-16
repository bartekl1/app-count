#!/bin/bash

adb_list_user_apps_command="adb shell pm list packages -3 -i"
adb_list_system_apps_command="adb shell pm list packages -s -i"
termux_list_user_apps_command="cmd package list packages -3 -i"
termux_list_system_apps_command="cmd package list packages -s -i"

count_apps () {
    declare -A installers
    total=0

    while IFS= read -r line; do
        installer=$(echo "$line" | sed 's/.*installer=//')
        ((installers["$installer"]++))
        ((total++))
    done < <($1 2>/dev/null)

    for key in "${!installers[@]}"; do
        echo "$key: ${installers[$key]}"
    done |
    sort -rn -k2

    echo "Total: $total"
}

if echo $PREFIX | grep -o "com.termux" > /dev/null
then
    list_user_apps_command="$termux_list_user_apps_command"
    list_system_apps_command="$termux_list_system_apps_command"
else
    list_user_apps_command="$adb_list_user_apps_command"
    list_system_apps_command="$adb_list_system_apps_command"
fi

echo "User apps:"
count_apps "$list_user_apps_command"
echo
echo "System apps:"
count_apps "$list_system_apps_command"
