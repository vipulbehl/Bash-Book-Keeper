OUTPUT=$(zenity --forms --title="Login" --text="User/Admin Login" --separator="," --add-entry="User_id" --add-password="Password")
accepted=$?
if ((accepted != 0)); then
    echo "something went wrong"
    exit 1
fi

user_id=$(awk -F, '{print $1}' <<<$OUTPUT)
password=$(awk -F, '{print $2}' <<<$OUTPUT)

echo $user_id;
echo $password;


if [[ ( "$user_id" -eq 'vaibhav' && "$password" = "gulati" )]]
    then echo 'hello vipul behl';
    exit 1
fi
