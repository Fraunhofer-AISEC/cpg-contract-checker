
pragma solidity ^0.8.0;

contract Demo {
        constructor() payable{}
        receive() external payable{}

        uint _50 = address(this).balance/100*50; 
        uint _25 = address(this).balance/100*25; 

        address payable addr1 = address(0x583031D1113aD414F02576BD6afaBfb302140225);
        address payable addr2 = address(0xdD870fA1b7C4700F2BD7f44238821C26f7392148);

        function withdrawFunds() external {
            
            addr1.transfer(_50);
            addr2.transfer(_25);
        }

        function receiveFunds() external payable {}

        function getBalance() public view returns(uint){
            return address(this).balance;
        }
}
