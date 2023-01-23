function receiveApproval(address _sender, uint256 _value, TokenContract _tokenContract, string param) public {
    require(tokenContract.transferFrom(_sender, address(this), _value));
    if (param == 'your_first_code'){
        
    }
    if (param == 'your_second_code'){
        
    } 
    
}
