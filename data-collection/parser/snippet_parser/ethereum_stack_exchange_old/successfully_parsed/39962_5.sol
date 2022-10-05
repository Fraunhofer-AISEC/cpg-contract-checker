   pragma solidity ^0.4.20;
   contract BetProposition {
       uint public somevar;

       function BetProposition(uint _some) public {
         somevar = _some;
       }
   }

   contract Tester2 {
        mapping(uint => BetProposition[]) bets;

        function getBetsForMatchup(uint matchupIdentifier) public view returns (BetProposition[]) {
            return bets[matchupIdentifier];
        }

        function other(uint matchupIdentifier) public view returns(uint) {
             uint total = 0;
             BetProposition[] memory betsToCancel = getBetsForMatchup(matchupIdentifier);
             for (uint i = 0; i < betsToCancel.length; i++) {
                 total = total + betsToCancel[i].somevar();
             }
             return total;
        }
}
