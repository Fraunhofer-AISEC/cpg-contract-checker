pragma solidity >=0.7.0 <0.9.0;
contract Tester  {

string[] public deduped;
function dedupeKeys(string[] memory keys) public returns(string[] memory) {
   
    while(deduped.length > 0){
        deduped.pop();
    }
     if (keys.length == 0) return deduped;  
    bool found;
    string memory key;
    key = keys[0];
    deduped.push(key);   
    for(uint i=1; i<keys.length; i++) {
        found = false;
        key = keys[i];
        for(uint j=0; j<deduped.length; j++) {
            if(equal(deduped[j], key)) {
               found=true; 
            }
        }
        if (!found) {
            deduped.push(key);
        }
    }
    return deduped;
}

function equal(string memory _base, string memory _value)
    internal
    pure
    returns (bool) {
    bytes memory _baseBytes = bytes(_base);
    bytes memory _valueBytes = bytes(_value);

    if (_baseBytes.length != _valueBytes.length) {
        return false;
    }

    for (uint i = 0; i < _baseBytes.length; i++) {
        if (_baseBytes[i] != _valueBytes[i]) {
            return false;
        }
    }
            return true;
}
}