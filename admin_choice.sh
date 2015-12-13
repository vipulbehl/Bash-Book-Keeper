#setting some variables
id="root";
pass="admin";
database="bash";

#switch case to search a book
case $1 in
"1")~/book_search.sh
;;



#switch case to add a book
"2")

OUTPUT=$(zenity --forms --title="Add a Book" --text="Enter Book Details or 0 to go back" --separator="," --add-entry="Enter ISBN number : " --add-entry="Enter Book Name : "  --add-entry="Enter Author Name : " --add-entry="Enter Publication Year : ")
accepted=$?
if ((accepted != 0)); then
    echo "something went wrong"
    exit 1
fi

#Getting the values entered by the user

isbn=$(awk -F, '{print $1}' <<<$OUTPUT)
book_name=$(awk -F, '{print $2}' <<<$OUTPUT)
author_name=$(awk -F, '{print $3}' <<<$OUTPUT)
publication_year=$(awk -F, '{print $4}' <<<$OUTPUT)

#if [[ ( "$isbn" -eq '0' || "$book_name" -eq '0' || "$author_name" -eq '0' || "$publication_year" -eq '0' )]]
#	then
#	~/admin.sh
#else
	echo "INSERT into books (isbn,book_name,author_name,publication_year) VALUES ('$isbn','$book_name','$author_name','$publication_year')" | mysql --user=$id --password=$pass $database;
#fi
;;





#switch to update a book (this is incomplete and incorrect)
"3")

OUTPUT=$(zenity --forms --title="Update Book Entry" --text="Enter ISBN Number or 0 to go back" --separator="," --add-entry="Enter ISBN Number : ")
accepted=$?
if ((accepted != 0)); then
    echo "something went wrong"
    exit 1
fi

#Getting the values entered by the user

isbn=$(awk -F, '{print $1}' <<<$OUTPUT)

if [[ ( "$isbn" -eq '0' )]]
	then
	~/admin.sh
else
	~/update_record.sh $isbn
fi
;;






#switch case to delete a book
"4")

OUTPUT=$(zenity --forms --title="Delete a Book" --text="Enter the ISBN number or 0 to go back" --separator="," --add-entry="Enter ISBN Number : ")
accepted=$?
if ((accepted != 0)); then
    echo "something went wrong"
    exit 1
fi

#Getting the values entered by the user

isbn=$(awk -F, '{print $1}' <<<$OUTPUT)

if [[ ( "$isbn" -eq '0' )]]
	then
	~/admin.sh
else
	echo "DELETE from books where isbn='$isbn'" | mysql --user=$id --password=$pass $database;
fi
;;
esac
