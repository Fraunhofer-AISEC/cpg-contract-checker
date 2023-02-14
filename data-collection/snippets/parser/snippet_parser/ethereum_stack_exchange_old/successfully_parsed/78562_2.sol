pragma solidity ^0.5.0;

import "./Token.sol";


contract Example {
    Token public token;
    uint256 public lastAmount;

    constructor(Token _token) public {
        token = _token;
    }

    event TransferFromFailed(uint256 _amount);

    function tryTransferFrom(address _from, address _to, uint256 _amount) public returns(bool returnedBool, uint256 returnedAmount) {
        lastAmount = _amount; 
        

        (bool success, bytes memory returnData) =
            address(token).call( 
                abi.encodePacked( 
                    token.transferFrom.selector, 
                    abi.encode(_from, _to, _amount) 
                )
            );
        if (success) { 
            (returnedBool, returnedAmount) = abi.decode(returnData, (bool, uint256));
        } else { 
            
            emit TransferFromFailed(_amount);
        }
    }
}
