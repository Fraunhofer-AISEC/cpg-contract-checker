    pragma solidity <0.9.0;
    contract texteditor {
        struct book {
            string block;
            bytes10 coordinates;
        }
        book [] public books;
        function save(string calldata _blocks, bytes10   _coordinates) public{
            books.push(book(_blocks, _coordinates));
        }
        function read()view public returns (string){
            return books[_block][_coordinates];
        }
        function remove(string _blocks, bytes10 _coordinates) private {
            delete book[_blocks][_coordinates];
        }}
