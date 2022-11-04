
contract CloneFactory {
    address public implementationContract;
    address[] public allClones;

    event NewClone(address indexed _instance);

    mapping(address => address) public list;

    constructor(address _implementation) {
        implementationContract = _implementation;
    }

    function createClone(address _whoopyCreator) payable external returns(address instance) {
        instance = Clones.clone(implementationContract);
        (bool success, ) = instance.call{value: msg.value}(abi.encodeWithSignature("initialize(address)", _creator));
        allClones.push(instance);
        list[_creator] = instance;
        emit NewClone(instance);
        return instance;
    }
}