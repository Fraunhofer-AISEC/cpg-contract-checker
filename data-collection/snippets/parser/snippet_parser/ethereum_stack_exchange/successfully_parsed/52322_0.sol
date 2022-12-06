  pragma solidity ^0.4.21;

   contract Forward {
       address public receiver;



function Forward(address _receiver) {
    receiver = _receiver;
}

function() public payable {
    
    
    
    require(receiver.call.gas(gasleft() - 2000).value(msg.value)());
}
}
