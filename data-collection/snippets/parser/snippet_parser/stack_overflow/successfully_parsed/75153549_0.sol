contract ViewContract{
    
    function callStateModifyingFunc() public view {
        require(address(this).balance >= gasleft(), "Insufficient balance in contract to cover gas costs.");
        modifyContract.setName("Blovario");
    }
}
