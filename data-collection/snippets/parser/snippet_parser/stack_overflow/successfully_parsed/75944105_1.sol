contract Factory {

    address private addr;

    constructor() {}

    function DeployContract() public {
        addr = address(new Test());
    }

    function getAddress() external view returns (address) {
        return addr;
    }
}
