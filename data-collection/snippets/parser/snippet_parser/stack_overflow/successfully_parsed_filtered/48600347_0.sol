function reverseValue(string _base) internal returns(string){
        bytes memory _baseBytes = bytes(_base);

        string memory _tempValue = new string(_baseBytes.length);
        bytes memory _newValue = bytes(_tempValue);

        for(uint i=_baseBytes.length;i<=0;i--){
            _newValue[_baseBytes.length - i] = _baseBytes[i];
        }

        return string(_newValue);
    }
