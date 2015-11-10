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
database="bash";

echo $database;

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

if [[ ( "$user_id" -eq 'major' && "$password" = "Password123?" )]]
#	then mysql --user=$user_id --password=$password $database;
#	then mysql -u major -h 50.62.209.49 3306 -p

# database name-> bash , schema-> id int, name varchar(10/20)
#please change login details
#please put some data in the table to see output



	#then query=$(zenity --entry --text "Enter Query?" --width=500 --entry-text="SELECT id,name FROM bash_table");
	then function1;
	if [[ ! -z $query ]]
	then echo $query | mysql -A -u $user_id -h 50.62.209.49 major -p$password | tr '\t' '\n' | zenity --list --title="Details" --text="" --column="id" --column="isbn" --column="book_name" --column="author_name";
	else
	#echo query=$(zenity --entry --text "Re-enter Query!!!" --width=500 --entry-text="SELECT id,name FROM bash_table");
	function2;
	fi	



#echo "SELECT id,name FROM bash_table" | mysql --user=$user_id --password=$password $database | tr '\t' '\n' | zenity --list --title="Details" --text="" --column="id" --column="Name"

else
	zenity --error --text "Check User_id/Password";
fi
