pragma solidity ^0.4.21;
import "https://github.com/OpenZeppelin/zeppelin-solidity/contracts/ownership/Ownable.sol";
import "./MyToken.sol";

contract Buy is Ownable{
    MyToken my_token;

    function setToken( address _cotract_address ) public onlyOwner{
        my_token = MyToken( _cotract_address );
    }

    function buyPoint( uint _amount ) public{       
        my_token.transfer( owner, _amount );
    }
}
