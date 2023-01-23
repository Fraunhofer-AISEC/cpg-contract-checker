pragma solidity ^0.4.0;




contract TicketPurchaser {
    mapping (bytes6 => address) tickets;                        
    mapping (bytes6 => bool) expired;                           
    uint TicketPrice;                                           

    
    function BuyTicket() public payable returns (string) {
        
        require(msg.value >= TicketPrice);
        if (msg.value > TicketPrice) {
            msg.sender.transfer(msg.value-TicketPrice);
        }

        SaveCode(GenerateSixDigitCode());
    }

    function GenerateSixDigitCode() private view returns (bytes6) {





        








        







        
  

        SixDigit = "X4C9BA";
        return SixDigit;
    }

    
    function ToAlphaIndex(bytes1 x, bytes1 y) private pure returns (uint8) {
        return uint8((uint16(x) + uint16(y)) * 9 / 8);
    }

    
    function SaveCode(bytes6 SixDigit) private {
        
        
        
        tickets[SixDigit] = msg.sender;
    }

    
    
    function RedeemTicket(bytes6 SixDigit) public payable returns (bool) {
        

        
        
        require(tickets[SixDigit] > 0);


        
        
        if ( !expired[SixDigit] ) {
            expired[SixDigit] = true;
            return true;
            
        } else {
            return false;                   
            
        }
    }
}
