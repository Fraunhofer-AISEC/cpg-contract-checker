function tokenValue( address _token, uint _amount ) public view returns ( uint ) {
        return _amount.mul( 10 ** IERC20( MY_TOKEN ).decimals() ).div( 10 ** IERC20( _token ).decimals() );
    }
