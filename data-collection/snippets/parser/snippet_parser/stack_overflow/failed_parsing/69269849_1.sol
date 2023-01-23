contract Caller is Owner {

    function callOtherContract(uint256 number) external onlyOwner {
        (bool sucess,)=contractAddress.call(abi.encodeWithSignature("doSomething(uint256,address)", number, msg.sender);
        require(success);
    }
}
