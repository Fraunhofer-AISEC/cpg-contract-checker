pragma solidity ^0.4.15;
import "./libs/zeppelin/crowdsale/CappedCrowdsale.sol";
import "./libs/zeppelin/crowdsale/FinalizableCrowdsale.sol";

contract TokenSale is CappedCrowdsale, FinalizableCrowdsale {

    mapping (address => uint256) public participationWeis;
    address[] public participationAddressLUT;

    function TokenSale(uint256 _startTime, uint256 _endTime, uint256 _rate, uint256 _goal, uint256 _cap, address _wallet, address _tokenContractAddress)
        CappedCrowdsale(_cap)
        FinalizableCrowdsale()
        Crowdsale(_startTime, _endTime, _rate, _wallet)
    {
        bootstrapParticipation();
    }


     function bootstrapParticipation() internal {
        address participant = 0xcede48d8ac162d1b08ed9419010de3c99f2cfdd6;
        uint256 weiAmount = 1000000;
        participationWeis[participant] = participationWeis[participant].add(weiAmount);
        participationAddressLUT.push(participant);

        participant = 0x854bd635fd4e8684a326664e0698c8fefae6dd97;
        weiAmount = 5000000;
        participationWeis[participant] = participationWeis[participant].add(weiAmount);
        participationAddressLUT.push(participant);
      }


    function participationSize() public returns (uint256) {
        return participationAddressLUT.length;
    }

}
