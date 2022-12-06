function send(bytes memory info, address moreInfo) public {
    (bool success,) = address(this).call(abi.encodePacked(abi.encodeWithSignature("foo((bytes))", info), moreInfo));
}
    
function foo(bytes memory info) public {
    address moreInfo = address(0);
    if (msg.data.length >= 24) { 
        assembly {
            moreInfo := shr(96,calldataload(sub(calldatasize(),20)))
        }
    }
    
}
