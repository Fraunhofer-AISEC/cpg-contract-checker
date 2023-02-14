pragma solidity 0.4.19; 

contract Okay {

    modifier onlyIfOkay() {
        require(isOkay(msg.sender));
        _;
    }

    function isOkay(address checkOkay) public pure returns(bool isIndeed) {
        
        return checkOkay==checkOkay;
    }

    function restricted() public view onlyIfOkay {
        
    }

}
