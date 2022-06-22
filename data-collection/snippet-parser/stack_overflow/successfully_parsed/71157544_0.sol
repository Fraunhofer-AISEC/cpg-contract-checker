    uint public userBlance = address(this).balance ;

function getBalance() public view returns (uint){
    uint balance = address(this).balance;
    return balance;
}
