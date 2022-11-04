contract A {

    modifier onlyOwner() {
        require(getOwner() == msg.sender);
        _;
    }
    
    function getOwner() internal returns(address);  

    function performOperation() internal; 

    function updateState() public onlyOwner() {
        performOperation();
    }

}
