function reverseValue(string _base) internal returns(string){
        bytes memory _baseBytes = bytes(_base);
        assert(_baseBytes.length > 0);

        string memory _tempValue = new string(_baseBytes.length);
        bytes memory _newValue = bytes(_tempValue);


        for(uint i=0;i<_baseBytes.length;i++){
            _newValue[ _baseBytes.length - i - 1] = _baseBytes[i];
        }

        return string(_newValue);
    }
