
pragma solidity ^0.8.16;


Books[] public individual_book;


struct Books {
    string author;
    string title;

}

function add_books(  string  _author,  string  _title) public  {
        individual_book.push(Books(_author, _title));

 }   
