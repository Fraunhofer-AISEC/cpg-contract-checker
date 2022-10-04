contract I is Ownerable {
    function transferAsset(address _from, address _to) public onlyOwner;
}

contract A is I {
    address asset;

    function transferAsset(address _to) public onlyOwner {
        asset = _to;
    }
}

contract B is I {
    I contractA;

    function doTransfer(address _to) public onlyOwner {
        contractA = I(A_Deployed_Address);

        contractA.transferAsset(_to);
    }
}
