#Code to show the 

OUTPUT=$(zenity --forms --title="Select an Option" --text="`echo "1.Search for a Book.\n\n2.Add a book.\n\n3.Update a Book.\n\n4.Delete a Book."`" --separator="," --add-entry="Enter Your Choice(1,2,3,4)")
accepted=$?
if ((accepted != 0)); then
    echo "something went wrong"
    exit 1
fi

#Getting the values entered by the user

admin_choice=$(awk -F, '{print $1}' <<<$OUTPUT)

#redirecting to the apropriate search file according to user choice
case $admin_choice in
"1") ~/admin_choice.sh 1;; #can pass a command line argument here to restore the user session
"2") ~/admin_choice.sh 2;;
"3") ~/admin_choice.sh 3;;
"4") ~/admin_choice.sh 4;;
esac

query="INSERT into users (email,full_name,password,user_type) VALUES ('$email','$name','$password','normal')"

user_id="root"
password="admin"
database="bash"

echo $query | mysql --user=$user_id --password=$password $database;
