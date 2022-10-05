contract Test {
    struct TestStruct {
        string name;
        bytes32 value;
    }

    struct ConfigStruct {
        bytes32[] valuesPossible;
    }

    TestStruct[] public structs;
    ConfigStruct[] configs;


    function constructor(bytes32[] _valuesToStore) public {
        configs.push(ConfigStruct(_valuesToStore));
    }

    function add(string _name, uint _idConfig, bytes32 _valueToStore) valueIsPossible(_idConfig, _valueToStore) public {
        structs.push(TestStruct("test", _valueToStore));
    }

    modifier valueIsPossible(uint _idConfig, bytes32 _valueToStore) {
        
        _;
    }
}
