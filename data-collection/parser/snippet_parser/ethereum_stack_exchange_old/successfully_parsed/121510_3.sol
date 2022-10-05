pragma solidity 0.7.6;



contract Implementation {

    uint public _nonce;

    function seeSomething() public view returns(address) {
        return address(this);
    }

    function saySomething() public returns(uint nonce) {
        nonce = _nonce++;
    }
}

contract Forwarder {

    address public implementation;

    event StaticCallCheck();

    constructor(address _implementation) {
        implementation = _implementation;
    }

    function staticCallChecker() external {
        require(msg.sender == address(this), "Access denied");
        emit StaticCallCheck();
    }

    function isStaticCall() public returns(bool isStatic) {
        try this.staticCallChecker() {} catch {
            isStatic = true;
        }
    }

    fallback() external {
        _fallback();
    }

    receive() external payable {
        _fallback();
    }

    function _fallback() private {

        
        require(isStaticCall(), "That was not a static call");
        

        address _implementation = address(implementation);

        uint256 value = msg.value;
        
        assembly {
            
            
            
            calldatacopy(0, 0, calldatasize())

            
            
            let result := call(gas(), _implementation, value, 0, calldatasize(), 0, 0)

            
            returndatacopy(0, 0, returndatasize())

            switch result
            
            case 0 { revert(0, returndatasize()) }
            default { return(0, returndatasize()) }
        }      
    }
}
