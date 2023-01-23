    constructor(address _implementation) {
        implementationContract = _implementation;
    }

    function createClone(address _creator) payable external returns(address instance) {
        instance = Clones.clone(implementationContract);
        (bool success, ) = instance.call{value: msg.value}(abi.encodeWithSignature("initialize(address)", _creator));
        allClones.push(instance);
        emit NewClone(instance);
        return instance;
    }
