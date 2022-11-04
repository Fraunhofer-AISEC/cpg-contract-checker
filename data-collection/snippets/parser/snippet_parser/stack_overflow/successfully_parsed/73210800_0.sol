pragma solidity ^0.5.11;
pragma experimental ABIEncoderV2;

contract Mapping {

    struct teamWallets {
        string name;
        uint256 balance;
    }

    string name = "";
    uint256 balance = 0;
    teamWallets[] public _teamWallets;
    
    mapping(address => teamWallets) public getInfoByWallet;

    function addteamData(string memory _name, uint256 _balance) public {
        _teamWallets.push(teamWallets(_name, _balance));
    }

    function setInfo(address _wall, teamWallets memory) public {
        getInfoByWallet[_wall] = teamWallets;
    }
}
