function getData(string memory _key) public returns (string memory _stringData, address _addressData, uint _uintData, bytes memory _bytesData, bool _boolData) {

    Delegate _delegate = Delegate(MAN.getLatestDelegateContract()); 
    
    string memory _methodName = _delegate.getDataType(_key);
    
    bytes memory _input = abi.encodePacked(bytes4(keccak256(abi.encodePacked("get",_methodName,"(bytes32)"))),keccak256(abi.encodePacked(_key)));
    
    (bool success, bytes memory ret) = address(deployedEternalStorages).call(_input);
        

        if (success) {
        
        if(keccak256(abi.encodePacked(_methodName)) == keccak256("address")){
            
            
        }
        else if(keccak256(abi.encodePacked(_methodName)) == keccak256("uint")){
            
            
        }
        else if(keccak256(abi.encodePacked(_methodName)) == keccak256("bytes")){
            _bytesData = ret;
        }
        else if(keccak256(abi.encodePacked(_methodName)) == keccak256("bool")){
            
            
        }
        else{
            _stringData = string(ret);
        }
    } else {
        
        revert();
    }
}
