pragma solidity ^0.7.4;

contract FoundersWallet is Ownable {

    address payable Ceo = 0x471F9361ec8Fc947d371B95e5a5f5820C7A42A1B;
    address payable Cto = 0x471F9361ec8Fc947d371B95e5a5f5820C7A42A1B;
    address payable Cfo = 0x471F9361ec8Fc947d371B95e5a5f5820C7A42A1B;

    function withdraw() external returns(bool) { 
        
        uint256 amount = address(this).balance;

        if(amount > 0) {
            Ceo.transfer((amount / 40));
            Cto.transfer((amount / 40));
            Cfo.transfer((amount / 20));
            
            return true; 
        }
        
        
        return false;
    }
}
