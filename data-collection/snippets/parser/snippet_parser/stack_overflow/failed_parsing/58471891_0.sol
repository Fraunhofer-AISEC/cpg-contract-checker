Contract ThirdParty {
    address owner;

    function f() public {}
}


Contract Child is ThirdParty {

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function f() public onlyOwner {}
}
