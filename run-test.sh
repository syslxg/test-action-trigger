for i in $(seq 41 80); do 
    git checkout main
    git checkout -b pr${i}
    echo pr${i} >> README.md
    git add README.md
    git ci -m pr${i}
    git push --set-upstream origin pr${i}
    gh pr create --base main --fill --title pr${i}
    gh pr close pr${i} -d
    sleep 2
done