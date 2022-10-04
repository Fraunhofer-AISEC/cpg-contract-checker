
pragma solidity ^0.8.0;

contract Demo {
        constructor() payable{}
        receive() external payable{this.withdrawFunds();}

        function withdrawFunds() external payable{
            address addr1 = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
            address addr2 = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;
            address addr3 = 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB;

            address payable wallet1 = payable(addr1);
            address payable wallet2 = payable(addr2);
            address payable wallet3 = payable(addr3);

            uint _50 = address(this).balance*50/100; 
            uint _25 = address(this).balance*25/100; 
            uint s_25 = address(this).balance*25/100; 

            wallet1.transfer(_50);
            wallet2.transfer(_25);
            wallet3.transfer(s_25);
        }

        function getBalance() public view returns(uint){
            return address(this).balance;
        }

        function receiveFunds() external payable {}
}
