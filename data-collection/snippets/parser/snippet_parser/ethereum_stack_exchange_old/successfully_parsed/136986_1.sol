
contract BaseContract is Ownable {
    constructor() Ownable() {}

    

    function withdraw() public onlyOwner {
      uint256 ownerBalance = address(this).balance;
      require(ownerBalance > 0, "No balance in the contact");

      (bool sent, ) = msg.sender.call{value: address(this).balance}("");
      require(sent, "Failed to send user balance back to the owner");
    }
}

contract MockReceiver {
    BaseContract base;

    constructor(){
       base = new BaseContract();
    }

    function testWithdraw() {
      base.withdraw();
    }

}

