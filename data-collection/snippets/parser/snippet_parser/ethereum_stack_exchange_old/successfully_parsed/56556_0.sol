contract PorrolhoTokenCrowdsale is PostDeliveryCrowdsale {

    constructor(uint256 _openingTime, uint256 _closingTime, uint256 _rate, address _wallet, uint256 _goal, ERC20 _token) public
    Crowdsale(_rate, _wallet, _token)
    TimedCrowdsale(_openingTime, _closingTime)
    {

    }

}
