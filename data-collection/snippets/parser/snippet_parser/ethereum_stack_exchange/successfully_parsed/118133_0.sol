    uint public bal = address(this).balance;
    
    function getBalance() public view returns (uint) {
            return address(this).balance;
    }
