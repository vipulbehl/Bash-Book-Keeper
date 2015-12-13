OUTPUT=$(zenity --forms --title="Login" --text="User/Admin Login" --separator="," --add-entry="User_id" --add-password="Password")
accepted=$?
if ((accepted != 0)); then
    echo "something went wrong"
    exit 1
fi

#accepting userid and password from the user.
user_id=$(awk -F, '{print $1}' <<<$OUTPUT)
password=$(awk -F, '{print $2}' <<<$OUTPUT)


#setting some variables
id="root";
pass="admin";
database="bash";


#checking if the userid and password that the user has entered is correct or not
result=`echo "SELECT * FROM users WHERE email='$user_id' AND password='$password'" | mysql --user=$id --password=$pass -s -N $database`
user_type_check=`echo "SELECT user_type FROM users WHERE email='$user_id' AND password='$password'" | mysql --user=$id --password=$pass -s -N $database`

normal="normal"

#checking if the select query returned a value or not
if [ -z "$result" ]
then
	echo "Username and password invalid.";
else
	case $user_type_check in
	"normal") ~/book_search.sh;; #can pass a command line argument here to restore the user session
	"admin") ~/admin.sh;;
	esac
fi

#echo $result;

#| tr '\t' '\n' | zenity --list --title="Details" --text="" --column="id" --column="Name";

#if [[ ( "$user_id" -eq 'root' && "$password" = "admin" )]]
#then
#echo "SELECT id,name FROM bash_table" | mysql --user=$user_id --password=$password $database | tr '\t' '\n' | zenity --list --title="Details" --#text="" --column="id" --column="Name";

#fi

