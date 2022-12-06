pragma solidity 0.4.18;




contract Betslip {

    uint stake;
    address opponent;

    function Betslip (uint _stake, address _opponent) public {
        stake = _stake;
        opponent = _opponent;
    }

    

}
