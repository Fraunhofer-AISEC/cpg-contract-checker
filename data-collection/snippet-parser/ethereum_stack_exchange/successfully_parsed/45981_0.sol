 pragma solidity ^0.4.18;

contract ETHTEST2 {
    mapping(address => uint256) public deposits; 

    uint256 public z;
    uint256 public t;

    function sendETHtoContract(uint256 j) public payable {  

        if (j == 1){

            z = j;
            msg.value == t;
            t = 24000000000000000000 wei;
            address(this).transfer(msg.value);
            return;
        }

        if (j == 2){

            z = j;
            t = 12000000000000000000 wei;
            address(this).transfer(msg.value);
            return;
        }

        if (j == 3){

            z = j;
            t = 6000000000000000000 wei;
            address(this).transfer(msg.value);
            return;
        }

        if (j >=4 || j < 0){  
            revert();
            return;
        }

    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function() public payable {
    
    }

}
