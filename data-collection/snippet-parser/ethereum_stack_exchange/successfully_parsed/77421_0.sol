pragma solidity 0.5.1;

contract destroy {
    constructor(address payable receiver) public payable {
        selfdestruct(receiver);
    }
}

contract Test {

     function() external payable { }

    function transfer(address _to, uint256 _amount) external {
       
    }

}
