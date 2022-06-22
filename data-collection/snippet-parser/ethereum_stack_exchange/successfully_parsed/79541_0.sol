   function transferFunds(uint _value) private {
        uint _fee = (3*_value)/(2*100);

        
        merchant.transfer(_value - _fee);
        admin.transfer(_fee);
        emit LogForwardedEther(_value, merchant, _value - _fee, admin, _fee);
    }

   function transferFunds(address _token) private {
        uint _value = ERC20(_token).balanceOf(address(this));
        uint _fee = (3*_value)/(2*100);

        
        ERC20(_token).transfer(merchant, _value - _fee);
        ERC20(_token).transfer(admin, _fee);
        emit LogForwardedToken(_value, merchant, _value - _fee, admin, _fee, _token);
    }
