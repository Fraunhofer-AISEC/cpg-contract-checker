

pragma solidity 0.8.13;

import "@openzeppelin/contracts/proxy/beacon/BeaconProxy.sol";
import "./TokenBeacon.sol";
import "./Token.sol";

contract TokenFactory {
    mapping(uint32 => address) private tokens;

    TokenBeacon immutable beacon;

    constructor(address _initialBlueprint) {
        beacon = new TokenBeacon(_initialBlueprint);
    }

    
    function createToken(string memory _name, string memory _symbol, uint32 _tokenID) external {
        BeaconProxy token = new BeaconProxy(
            address(beacon),
            abi.encodeWithSelector(
                Token(address(0)).initialize.selector,
                _name,
                _symbol
            )
        );
        tokens[_tokenID] = address(token);
    }

    function getTokenAddress(uint32 _id) public view returns(address) {
        return tokens[_id];
    }

    function getBeacon() public view returns(address) {
        return address(beacon);
    }

    function getImplementation() public view returns(address) {
        return beacon.implementation();
    }
}

