contract ReciveEther {
    function() external payable {}
    function getBalance() public view returns (uint){
    return address(this).balance;
    }
    
    function getAddress() public view returns (address){
    return address(this);
    }
}
   
