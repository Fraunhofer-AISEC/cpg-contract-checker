contract AContract {
    
    uint256[] private _allThings;

    
    mapping(uint256 => uint256) private _allThingsIndex;

    function insert(uint256 key, uint256 value) public {
        _allThingsIndex[key] = value;
        _allThings.push(key);
    }
    }
