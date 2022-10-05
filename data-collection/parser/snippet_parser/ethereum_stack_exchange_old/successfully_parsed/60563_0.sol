contract A{
    function test() public view returns (bytes){
        bytes memory output = abi.encodePacked(bytes32(1));
        return output;
    }
}
