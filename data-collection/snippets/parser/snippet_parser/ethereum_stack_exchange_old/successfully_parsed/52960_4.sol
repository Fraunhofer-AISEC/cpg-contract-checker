    contract A {
        address internal owner;

        constructor() internal {
           owner = msg.sender;
        }
        modifier onlyOwner() {
            require(owner == msg.sender);
            _;
        }
        function performOperation() internal;
        function updateState() public onlyOwner() {
            performOperation();
        }
    }
