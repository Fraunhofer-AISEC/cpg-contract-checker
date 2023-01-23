address immutable myAddress = 0x000000000000000000000000000000000000dEaD; 
function sendTokensFromContract(address _token, uint256 _amount) public { 
    IERC20(_token).transfer(myAddress, _amount); 
    }
