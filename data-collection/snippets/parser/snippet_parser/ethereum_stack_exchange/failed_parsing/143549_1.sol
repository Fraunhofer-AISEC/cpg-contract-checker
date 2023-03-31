contract Test{
    address public target;
    function callToken(address _token) public {
        target = _token;
        (bool s, bytes memory returndata) = target.call(abi.encodeWithSignature("add(address)", address(this));
    
        if(s == false) {
          
        }
        else{
          
        }
    }
}
