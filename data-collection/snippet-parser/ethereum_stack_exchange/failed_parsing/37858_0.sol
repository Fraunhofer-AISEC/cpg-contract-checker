



contract TheTokenContract {
    
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
}

contract YourNewContract {

    
    function sendTheToken(address _from, address _to, uint256 _value) public {

        
        address tokenContractAddress = <TokenAddress>;

        
        TheTokenContract token = TheTokenContract(tokenContractAddress);

        
        bool sendSuccess = token.transferFrom(_from, _to, _value);

    }

}
