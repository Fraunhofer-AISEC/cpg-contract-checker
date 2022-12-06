
pragma solidity ^0.8.12;

import "./FutNFTTransfer.sol";
import "./VRFConsumer.sol";

contract FutNFTMatch is FutNFTTransfer, VRFConsumer {
    uint256 public levelPercentSuitablePosition;
    uint256 public levelPercentNoPosition;
    mapping(string => string[]) public formationToPositions;
    string[] public formations;
    string[] public allPositions;
    uint256 public lineupFee = 3 ether;
    uint256 public matchFee = 1 ether;
    
    address[] public lineupSet;

    modifier playersOwned(uint256[11] memory _playerIds) {
        for (uint256 i = 0; i < _playerIds.length; i++) {
            require(ownerOf(_playerIds[i]) == msg.sender);
        }
        _;
    }

    modifier lineUpSet(address _owner) {
        require(lineUps[_owner].isValid, "Linup not set");
        _;
    }

    constructor() {
        formations.push("4-3-3");
        formationToPositions["4-3-3"] = [
            "GK",
            "LB",
            "CB",
            "CB",
            "RB",
            "CMF",
            "CMF",
            "CMF",
            "LWF",
            "ST",
            "RWF"
        ];
        formations.push("4-3-3 attack");
        formationToPositions["4-3-3 attack"] = [
            "GK",
            "LB",
            "CB",
            "CB",
            "RB",
            "CMF",
            "AMF",
            "CMF",
            "RWF",
            "ST",
            "LWF"
        ];
        allPositions = [
            "LWF",
            "ST",
            "RWF",
            "CF",
            "AMF",
            "CMF",
            "DMF",
            "LMF",
            "RMF",
            "RB",
            "LB",
            "CB",
            "GK"
        ];
    }

    function setMatchFee(uint256 _fee) public onlyOwner {
        matchFee = _fee;
    }

    function setLineupFee(uint256 _fee) public onlyOwner {
        lineupFee = _fee;
    }

    function getAllFormations() public view returns (string[] memory) {
        return formations;
    }

    function getLineup(address _owner) public view returns (LineUp memory) {
        return lineUps[_owner];
    }

    function addFormation(string memory formation, string[] memory positions)
        public
        onlyOwner
    {
        formationToPositions[formation] = positions;
        formations.push(formation);
    }

    function getPositionsFromFormation(string memory formation)
        public
        view
        returns (string[] memory)
    {
        return formationToPositions[formation];
    }

    function getAllPositions() public view returns (string[] memory) {
        return allPositions;
    }

    function setLevelPercentSuitablePosition(uint256 _percent)
        public
        onlyOwner
    {
        levelPercentSuitablePosition = _percent;
    }

    function setLevelPercentNoPosition(uint256 _percent) public onlyOwner {
        levelPercentNoPosition = _percent;
    }

    function setLineUp(
        uint256[11] memory _playerIds,
        string[11] memory _positions,
        string memory _formation
    ) external payable playersOwned(_playerIds) returns (uint256) {
        require(msg.value == lineupFee, "Required fee not sent!");
        lineUps[msg.sender] = LineUp(_playerIds, _positions, _formation, true);
        lineupSet.push(msg.sender);
        return _getTeamRating(msg.sender);
    }

    function _getTeamRating(address _owner)
        internal
        view
        lineUpSet(_owner)
        returns (uint256)
    {
        LineUp memory lineup = lineUps[_owner];
        uint256 sum;
        uint256 count;
        for (uint256 i = 0; i < lineup.playerIds.length; i++) {
            sum += _getPlayerLevel(lineup, i);
            count++;
        }
        return sum / count;
    }

    function _getPlayerLevel(LineUp memory _lineup, uint256 _arrayPosition)
        internal
        view
        returns (uint256)
    {
        Player memory player = super.getPlayer(
            _lineup.playerIds[_arrayPosition]
        );
        string memory position = _lineup.positions[_arrayPosition];
        uint256 level;
        if (
            keccak256(abi.encodePacked(player.preferredPosition)) ==
            keccak256(abi.encodePacked(position))
        ) {
            level = player.level;
        } else {
            level = _getPlayerLevelForUnpreferredPosition(player, position);
        }
        return level;
    }

    function _getPlayerLevelForUnpreferredPosition(
        Player memory _player,
        string memory _position
    ) internal view returns (uint256) {
        uint256 level = (_player.level * levelPercentNoPosition) / 100;
        for (uint256 k = 0; k < _player.suitablePositions.length; k++) {
            if (
                keccak256(abi.encodePacked(_player.suitablePositions[k])) ==
                keccak256(abi.encodePacked(_position))
            ) {
                level = (_player.level * levelPercentSuitablePosition) / 100;
                break;
            }
        }
        return level;
    }

    function getOpponent() public lineUpSet(msg.sender) returns(address) {
        require(lineupSet.length > 1, "Players not available!");
        getRandomNumber();
        randomResult = (randomResult % lineupSet.length) + 1;
        address opponent = lineupSet[randomResult - 1];
        if(msg.sender == opponent) {
            if(randomResult == lineupSet.length) {
                opponent = lineupSet[randomResult - 2];
            } else {
                opponent = lineupSet[randomResult];
            }
        }
        return opponent;
    }

    function play()
        external
        payable
        lineUpSet(msg.sender)
    {
        require(msg.value == matchFee, "Required fee not sent!");
        address _opponent = getOpponent();
        uint256 teamRating = _getTeamRating(msg.sender);
        uint256 opponentTeamRating = _getTeamRating(_opponent);
        uint256 winProbability = 50;
        if (teamRating > opponentTeamRating) {
            winProbability = 50 + ((teamRating - opponentTeamRating) * 3);
        } else {
            winProbability = 50 - ((opponentTeamRating - teamRating) * 3);
        }
        getRandomNumber();
        randomResult = (randomResult % 100) + 1;
        address payable winner;
        if (randomResult <= winProbability) {
            ownerHistory[msg.sender].winCount++;
            ownerHistory[_opponent].lossCount++;
            winner = payable(msg.sender);
        } else {
            ownerHistory[msg.sender].lossCount++;
            ownerHistory[_opponent].winCount++;
            winner = payable(_opponent);
        }
        (bool sent, ) = winner.call{
            value: 
            4.5 ether
        }("");
        require(sent, "Could not complete transaction!");
    }
}
