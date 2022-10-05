pragma solidity ^0.8.0;
interface AnotherContract {
    function walletOfOwner(address owner) external view returns (uint256[] memory);
}

contract Test{
    uint public similarity;
    uint256 public hasRedPill;
    function test() public view returns(uint256  ){
       AnotherContract anotherContract = AnotherContract(address(0x116486FD64Ba04F7B789278B239E2e5A1e2f7b39));
      return anotherContract.walletOfOwner(msg.sender).length;
    }


}
