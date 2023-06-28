contract AccessControl {

    address public ceoAddress;

    modifier onlyCEO() {
        require(msg.sender == ceoAddress);
        _;
    }

    constructor() {
        
        ceoAddress = msg.sender;
    }

    function setCEO(address _newCEO) external onlyCEO {
        require(_newCEO != address(0));

        ceoAddress = _newCEO;
    }
}
