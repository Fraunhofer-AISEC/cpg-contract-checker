contract WrapperCreator {

    function WrapperCreator() {
    }

    function createTopic(string name, bytes32[] resultNames, uint256 endBlock)
        returns (Topic tokenAddress)
    {
        return new Topic(name, resultNames, bettingEndBlock);
    }
}
