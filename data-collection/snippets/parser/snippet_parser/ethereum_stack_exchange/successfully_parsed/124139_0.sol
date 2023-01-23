contract Storage {
    receive() external payable {}

    
    fallback() external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function getMoney() public payable returns (bool) {
        
        return true;
    }

}
