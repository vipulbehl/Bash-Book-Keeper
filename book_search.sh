#Code to show the 

OUTPUT=$(zenity --forms --title="Search For a Book" --text="`echo "1.Search By ISBN.\n\n2.Search By Book Name.\n\n3.Search By Author Name.\n\n4.Search By Publication Year."`" --separator="," --add-entry="Enter Your Choice(1,2,3,4)")
accepted=$?
if ((accepted != 0)); then
    echo "something went wrong"
    exit 1
fi

#Getting the values entered by the user

search_choice=$(awk -F, '{print $1}' <<<$OUTPUT)

#redirecting to the apropriate search file according to user choice
case $search_choice in
"1") ~/search_result.sh 1;; #can pass a command line argument here to restore the user session
"2") ~/search_result.sh 2;;
"3") ~/search_result.sh 3;;
"4") ~/search_result.sh 4;;
esac

query="INSERT into users (email,full_name,password,user_type) VALUES ('$email','$name','$password','normal')"

user_id="root"
password="admin"
database="bash"

echo $query | mysql --user=$user_id --password=$password $database;
