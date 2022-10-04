pragma solidity ^0.4.18;

contract ETHTEST {

    uint256 public y;
    address public remMem = 0x4152B21f407Ba23c6118c1641821EC4250DBf3B1;

    function transferETH(uint256 x) public payable returns(uint256){
    
    

        if (x == 1){

            y = x;
            remMem.transfer(24000000000000000000);
            return;
        }

        if (x == 2){

            y = x;
            remMem.transfer(12000000000000000000);
            return;
        }

        if (x == 3){

            y = x;
            remMem.transfer(6000000000000000000);
            return;
        }

        if (x >=4 || x < 0){  
            revert();
            return;
        }

    }

}
