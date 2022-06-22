pragma solidity ^0.5.16; 


contract ERC20 {
    function balanceOf(address _owner) public view returns (uint balance);
    function transfer(address _to, uint _value) public returns (bool success);
}

contract SweepFunds {
    
    
    address payable public merchant = RECIPIENT_ADDR; 
    address payable public admin = ADMIN_ADDR; 
    
    
    event LogForwardedEther(uint total, address indexed merchant, uint merchVal, address indexed admin, uint adminFee);
    event LogForwardedToken(uint total, address indexed merchant, uint merchVal, address indexed admin, uint adminFee, address indexed token);

    
    function() external payable {
        transferFunds(msg.value);
    }

    
    function flushEther() public payable {
        uint ethBal = address(this).balance;
        transferFunds(ethBal);
    }
    
    
    function sweepTokens(address _token) public {
        transferFunds(_token);
    }

    
    function transferFunds(uint _value) private {
        require(_value > 0);
        uint _fee = (NUMERATOR*_value)/(DENOMINATOR*100);
        
        
        emit LogForwardedEther(_value, merchant, _value - _fee, admin, _fee);
        merchant.transfer(_value - _fee);
        admin.transfer(_fee);
    }
    
    
    function transferFunds(address _token) private {
        uint _value = ERC20(_token).balanceOf(address(this));
        require(_value > 0);
        uint _fee = (NUMERATOR*_value)/(DENOMINATOR*100);
            
        
        emit LogForwardedToken(_value, merchant, _value - _fee, admin, _fee, _token);
        ERC20(_token).transfer(merchant, _value - _fee);
        ERC20(_token).transfer(admin, _fee);
    }
} 
