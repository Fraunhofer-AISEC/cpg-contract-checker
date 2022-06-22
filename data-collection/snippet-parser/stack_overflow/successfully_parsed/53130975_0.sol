function borrowBook(string _bName) payable returns (string){
    if(msg.sender != books[_bName].owner){
        if(books[_bName].available == true){
            if(getBalance()>=(books[_bName].amtSecurity + books[_bName].rate) ){
                books[_bName].borrower = msg.sender;
                books[_bName].available = false;
                books[_bName].owner.transfer(msg.value - books[_bName].amtSecurity);
                
                
                
                return "Borrowed Succesful";
            }else{
                return "Insufficient Fund";
            }
        }else{
            return "Currently this Book is Not Available!";
        }
    }else{
        return "You cannot Borrow your own Book";
    }
}
