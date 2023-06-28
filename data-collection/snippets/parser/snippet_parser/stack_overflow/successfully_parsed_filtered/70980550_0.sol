    contract Testing{
        mapping(uint => uint) _mapping;
        uint public _test = 0;
        struct valueStruct {
            uint value;
            uint time;
        }

    function getCount( uint _index) external returns(uint){
        uint _lastValue = _mapping[0];
        uint _lastIndex = 0;
        uint i = 0;
        uint _sum = 0;
        uint _diffCount = 1;
        do{
            if(_mapping[i] != _lastValue && _mapping[i] > 0){
                _lastValue = _mapping[i];
                _diffCount++;
            }
            i++;
        }while(i < _index);
        valueStruct[] memory _valueStruct = new valueStruct[](_diffCount);
        i = 0;
        uint _tmpIndex = 0;
        do{
            if(_mapping[i] != _lastValue && _mapping[i] > 0){
                _valueStruct[_tmpIndex++] = valueStruct(_mapping[i], i - _lastIndex);
                _lastIndex = i;
            }
            i++;
        }while(i < _index);
        _valueStruct[_tmpIndex] = valueStruct(_mapping[_lastIndex], i - _lastIndex);

        for(i = 0; i < _valueStruct.length; i++){
            _sum += _valueStruct[i].value * _valueStruct[i].time;
        }
        _test = _sum;
        return ( _sum);
     }
 }
