pragma solidity ^0.4.18;

import "./ConvertLib.sol";

contract SimpleAuction{
    event HiggestBidIncreased(address binder,uint amount);
    function bid()payable{
        HiggestBidIncreased(msg.sender,msg.value);
    }
}
