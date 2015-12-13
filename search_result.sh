#setting some variables
id="root";
pass="admin";
database="bash";

#switch case to search a book through isbn number
case $1 in
"1")

OUTPUT=$(zenity --forms --title="Search By ISBN" --text="Enter ISBN Number or 0 to go back" --separator="," --add-entry="Enter ISBN Number : ")
accepted=$?
if ((accepted != 0)); then
    echo "something went wrong"
    exit 1
fi

#Getting the values entered by the user

isbn=$(awk -F, '{print $1}' <<<$OUTPUT)

if [[ ( "$isbn" -eq '0' )]]
	then
	~/book_search.sh
else
	echo "SELECT id,isbn,book_name,author_name,publication_year FROM books WHERE isbn='$isbn'" | mysql --user=$id --password=$pass $database | tr '\t' '\n' | zenity --width=600 --height=400 --list --title="Book Details" --text="" --column="id" --column="ISBN" --column="Book Name" --column="Author Name" --column="Publication Year";
fi
;;




#switch case to search a book through book name
"2")

OUTPUT=$(zenity --forms --title="Search By Book Name" --text="Enter Book Name or 0 to go back" --separator="," --add-entry="Enter Book Name : ")
accepted=$?
if ((accepted != 0)); then
    echo "something went wrong"
    exit 1
fi

#Getting the values entered by the user

book_name=$(awk -F, '{print $1}' <<<$OUTPUT)

if [[ ( "$book_name" -eq '0' )]]
	then
	~/book_search.sh
else
	echo "SELECT id,isbn,book_name,author_name,publication_year FROM books WHERE book_name='$book_name'" | mysql --user=$id --password=$pass $database | tr '\t' '\n' | zenity --width=600 --height=400 --list --title="Book Details" --text="" --column="id" --column="ISBN" --column="Book Name" --column="Author Name" --column="Publication Year";
fi
;;





#switch case to search a book through author name
"3")

OUTPUT=$(zenity --forms --title="Search By Author Name" --text="Enter Author Name or 0 to go back" --separator="," --add-entry="Enter Author Name : ")
accepted=$?
if ((accepted != 0)); then
    echo "something went wrong"
    exit 1
fi

#Getting the values entered by the user

author_name=$(awk -F, '{print $1}' <<<$OUTPUT)

if [[ ( "$author_name" -eq '0' )]]
	then
	~/book_search.sh
else
	echo "SELECT id,isbn,book_name,author_name,publication_year FROM books WHERE author_name='$author_name'" | mysql --user=$id --password=$pass $database | tr '\t' '\n' | zenity --width=600 --height=400 --list --title="Book Details" --text="" --column="id" --column="ISBN" --column="Book Name" --column="Author Name" --column="Publication Year";
fi
;;






#switch case to search a book through publication year
"4")

OUTPUT=$(zenity --forms --title="Search By Publication Year" --text="Enter Publication Year or 0 to go back" --separator="," --add-entry="Enter Publication Year : ")
accepted=$?
if ((accepted != 0)); then
    echo "something went wrong"
    exit 1
fi

#Getting the values entered by the user

publication_year=$(awk -F, '{print $1}' <<<$OUTPUT)

if [[ ( "$publication_year" -eq '0' )]]
	then
	~/book_search.sh
else
	echo "SELECT id,isbn,book_name,author_name,publication_year FROM books WHERE publication_year='$publication_year'" | mysql --user=$id --password=$pass $database | tr '\t' '\n' | zenity --width=600 --height=400 --list --title="Book Details" --text="" --column="id" --column="ISBN" --column="Book Name" --column="Author Name" --column="Publication Year";
fi
;;
esac
