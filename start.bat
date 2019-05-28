echo @off

echo "Running App..."
call yarn install
start chrome "http://localhost:8080"
yarn serve
