_ERR=$(grep "command failed" < .ngrok.log)

if [[ -z "$_ERR" ]]; then

    echo $(grep -o -E "tcp://(.+)" < .ngrok.log | sed "s/tcp:\/\//ssh $1@/" | sed "s/:/ -p /")

else

    echo "$_ERR"

    exit 4

fi
