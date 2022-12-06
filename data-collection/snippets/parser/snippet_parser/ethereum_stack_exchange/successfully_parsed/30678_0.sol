contract BookStore {

enum BookStatus { Open, Sold, Unsold }

mapping(uint => Book) stores;
uint public count;

struct Book{  
uint bookId;  
string name;    
BookStatus status;
}

function BookStore() {
count = 0;   
}

function addP(string _name) {
count += 1;
Book memory b1= Book(count,_name,BookStatus.Open);
stores[count] = b1;    
}

function updateStatus (uint _bookId) public {
Book storage b1= stores[_bookId];
b1.status = BookStatus.Sold;
}

function getStatus(uint _bookId) public returns (BookStatus) {
Book storage b1= stores[_bookId];
return b1.status;
}

}
