pragma solidity ^0.4.25;

contract Augur {
     function createYesNoMarket(uint256 _endTime, uint256 _feePerEthInWei, ICash _denominationToken, address _designatedReporterAddress, bytes32 _topic, string _description, string _extraInfo) public afterInitialized payable returns (IMarket _newMarket);
}

contract AugurWrapper {
    Augur universe;
    constructor(address _address) public {
        universe = Augur(_address);
    }
    function myCreateMarket(uint256 _endTime, uint256 _feePerEthInWei, ICash _denominationToken, address _designatedReporterAddress, bytes32 _topic, string _description, string _extraInfo) public {
        return universe.createYesNoMarket(_endTime,_feePerEthInWei,_denominationToken,_designatedReporterAddress, _topic, _description, _extraInfo);
    }
}
