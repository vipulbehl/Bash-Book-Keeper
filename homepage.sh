#Setting permissions for all the files
chmod 755 homepage.sh
chmod 755 login.sh
chmod 755 register.sh
chmod 755 book_search.sh
chmod 755 search_result.sh
chmod 755 admin.sh
chmod 755 admin_choice.sh
chmod 755 update_record.sh

#Code to create the first login popup

OUTPUT=$(zenity --forms --title="Login/Register" --text="1.Login\t2.Signup" --separator="," --add-entry="Enter Choice(1/2)")
accepted=$?
if ((accepted != 0)); then
    echo "something went wrong"
    exit 1
fi

#Check which choice did the user entered

user_choice=$(awk -F, '{print $1}' <<<$OUTPUT)

#Performing actions on user supplied values

if [[ ( "$user_choice" -eq '1')]]
	then ~/login.sh;
elif [[ ( "$user_choice" -eq '2')]]
	then ~/register.sh;
else
	zenity --error --text "Invalid option entered";
fi
