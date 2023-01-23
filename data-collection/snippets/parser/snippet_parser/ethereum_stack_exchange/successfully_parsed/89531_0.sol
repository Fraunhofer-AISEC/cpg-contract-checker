contract MultiTransfer {
    function multiTransfer(Marcelo token, address _addresses, uint256 amount) public {
        
            token.transfer(_addresses, amount);
        
    }
}
