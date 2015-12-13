#Code to create register popup

OUTPUT=$(zenity --forms --title="Register" --text="Register" --separator="," --add-entry="E-mail" --add-entry="Full Name" --add-password="Password")
accepted=$?
if ((accepted != 0)); then
    echo "something went wrong"
    exit 1
fi

#Getting the values entered by the user

email=$(awk -F, '{print $1}' <<<$OUTPUT)
name=$(awk -F, '{print $2}' <<<$OUTPUT)
password=$(awk -F, '{print $3}' <<<$OUTPUT)

query="INSERT into users (email,full_name,password,user_type) VALUES ('$email','$name','$password','normal')"

user_id="root"
password="admin"
database="bash"

echo $query | mysql --user=$user_id --password=$password $database;
