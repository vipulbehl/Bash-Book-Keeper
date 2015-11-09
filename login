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

if [[ ( "$user_id" -eq 'vaibhav' && "$password" = "gulati" )]]
#	then mysql --user=$user_id --password=$password $database;
#	then mysql -u major -h 50.62.209.49 3306 -p

# database name-> bash , schema-> id int, name varchar(10/20)
#please change login details
#please put some data in the table to see output

	then echo "SELECT id,name FROM bash_table" | mysql --user=$user_id --password=$password $database | tr '\t' '\n' | zenity --list --title="Details" --text="" --column="id" --column="Name"

else
	zenity --error --text "Check User_id/Password";
fi
