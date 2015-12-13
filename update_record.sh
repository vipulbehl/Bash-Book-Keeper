#Setting some variable values
id="root"
pass="admin"
database="bash"

isbn=$1;

OUTPUT=$(zenity --forms --title="Update Record" --text="Enter the fields to update" --separator="," --add-entry="ISBN" --add-entry="Book Name" --add-entry="Author Name" --add-entry="Publication Year")

accepted=$?
if ((accepted != 0)); then
    echo "something went wrong"
    exit 1
fi

#Getting the values entered by the user

isbn1=$(awk -F, '{print $1}' <<<$OUTPUT)
book_name=$(awk -F, '{print $2}' <<<$OUTPUT)
author_name=$(awk -F, '{print $3}' <<<$OUTPUT)
publication_year=$(awk -F, '{print $4}' <<<$OUTPUT)


#code to update the book name if the user has entered it
if [ -z "$book_name" ]
then 
	echo ""
else
	echo "UPDATE books SET book_name='$book_name' where isbn='$isbn'" | mysql --user=$id --password=$pass $database;
	echo "Record Updated"
fi


#code to update the author name if the user has entered it
if [ -z "$author_name" ]
then 
	echo ""
else
	echo "UPDATE books SET author_name='$author_name' where isbn='$isbn'" | mysql --user=$id --password=$pass $database;
	echo "Record Updated"
fi


#code to update the publication year if the user has entered it
if [ -z "$publication_year" ]
then 
	echo ""
else
	echo "UPDATE books SET publication_year='$publication_year' where isbn='$isbn'" | mysql --user=$id --password=$pass $database;
	echo "Record Updated"
fi


#code to update the isbn if the user has entered it
if [ -z "$isbn1" ]
then 
	echo ""
else
	echo "UPDATE books SET isbn='$isbn1' where isbn='$isbn'" | mysql --user=$id --password=$pass $database;
	echo "Record Updated"
fi


