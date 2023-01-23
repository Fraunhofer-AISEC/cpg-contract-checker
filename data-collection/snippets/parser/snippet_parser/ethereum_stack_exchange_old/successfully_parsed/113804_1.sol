contract B {
    function update() public override {
        (uint256[] memory _ids, address[] memory _addresses, A.Info[] memory _infos) = A.getInfoWithData();

        
    }
}
