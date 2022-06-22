pragma solidity ^0.4.0;

contract FirstContract {

    function createOtherContract() payable returns(address) {
        return (new SecondContract).value(msg.value)();
    }
}

contract SecondContract {
    function SecondContract() payable { 
    }

    function acceptEther() payable {
        
    }
}
