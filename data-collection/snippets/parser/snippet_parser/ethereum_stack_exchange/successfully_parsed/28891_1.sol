pragma solidity 0.5.11;

contract Outer {

    Inner inner;

    constructor(Inner _inner) public {
        inner = _inner;
    }

    

    function explored(bool succeed) public returns(bool success, bytes memory response) {
        
        (success, response) = address(inner).call(abi.encodeWithSignature("tryIt(bool)", succeed));
    }        
}

contract Inner {

    event LogActivity(address sender, bool successful);

    function tryIt(bool succeed) public returns(bool result) {
        emit LogActivity(msg.sender, succeed);
        require(succeed, "You wanted me to fail.");
        return true;
    }      
}
