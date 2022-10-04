contract ControlledAccess{

    address controller;

    constructor() public {
        controller = msg.sender;
    }

    modifier onlyController() {
        require(msg.sender == controller);
        _;
    }

}
