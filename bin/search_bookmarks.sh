#!/usr/bin/env bash
awk '/^\s*-/ {print $0}' ~/bookmarks.md | tr '\t' ' ' | sed -e 's/\s*-.*\[\(.*\)\](\(.*\)).*/\1\t\2/' | ~/.fzf/bin/fzf --delimiter='\t' --with-nth=1 --bind 'enter:execute-silent(nohup xdg-open {2}& > /tmp/nohup.out)+abort'


counter=1
while [ $counter -le 50 ]
do
WORKSPACES=$(i3-msg -t get_workspaces)
urgent=$(echo "$WORKSPACES" | jq '.[].urgent')
found_urgent=false
# echo "$urgent"
for u in $urgent
do
  # echo "$u"
  if [ "$u" == "true" ]; then
    found_urgent=true
    break
  fi
done
if [ $found_urgent == true ]; then
  i3-msg '[urgent=latest] focus'
  break
fi
((counter++))
done
echo "Done"
