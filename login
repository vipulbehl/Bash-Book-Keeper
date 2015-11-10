#Code to create the first login popup

OUTPUT=$(zenity --forms --title="Login" --text="User/Admin Login" --separator="," --add-entry="User_id" --add-password="Password")
accepted=$?
if ((accepted != 0)); then
    echo "something went wrong"
    exit 1
fi


#Getting the username and the password from the user.

user_id=$(awk -F, '{print $1}' <<<$OUTPUT)
password=$(awk -F, '{print $2}' <<<$OUTPUT)

#Functions to perform slect queries

function1 () {
query=$(zenity --entry --text "Enter Query?" --width=500 --entry-text="SELECT id,isbn,book_name,author_name FROM book_record");
if [[ -z $query ]]
then function2;
fi
}

function2 () {
query=$(zenity --entry --text "Enter Query!" --width=500 --entry-text="SELECT id,isbn,book_name,author_name FROM book_record");
if [[ -z $query ]]
then function1;
fi
}


#Checking for user log in

if [[ ( "$user_id" -eq 'major' && "$password" = "Password123?" )]]
then function1;
	if [[ ! -z $query ]]
	then echo $query | mysql -A -u $user_id -h 50.62.209.49 major -p$password | tr '\t' '\n' | zenity --list --title="Details" --text="" --	column="id" --column="isbn" --column="book_name" --column="author_name";
	else
	function2;
	fi
else
	zenity --error --text "Check User_id/Password";
fi
