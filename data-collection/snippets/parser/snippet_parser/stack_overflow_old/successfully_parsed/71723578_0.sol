
pragma solidity ^0.8.12;

import "./FutNFTTransfer.sol";
import "./VRFConsumer.sol";

contract FutNFTMatch is FutNFTTransfer, VRFConsumer {
    uint256 public levelPercentSuitablePosition = 75;
    uint256 public levelPercentNoPosition = 50;
    mapping(string => string[]) public formationToPositions;
    string[] public formations;
    string[] public allPositions;
    uint256 public lineupFee = 0.2 ether;
    uint256 public matchFee = 3 ether;
    address[] public lineupSet;
    mapping(address => uint256) public ownersToDeposits;

    modifier playersOwned(uint256[11] memory _playerIds) {
        for (uint256 i = 0; i < _playerIds.length; i++) {
            require(ownerOf(_playerIds[i]) == msg.sender, "Players not owned!");
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

    function deposit() public payable lineUpSet(msg.sender) {
        require(msg.value >= 1 ether, "Not enough funds sent!");
        ownersToDeposits[msg.sender] += msg.value;
        if (ownersToDeposits[msg.sender] < 2 ether) {
            lineupSet.push(msg.sender);
        }
    }

    function _removeFromLineupSet(address _owner) internal {
        address[] memory newLineupSet;
        uint256 subFromIndex = 0;
        for (uint256 i = 0; i < lineupSet.length; i++) {
            if (lineupSet[i] != _owner) {
                newLineupSet[i - subFromIndex] = lineupSet[i];
            } else {
                subFromIndex++;
            }
        }
        lineupSet = newLineupSet;
    }

    function withdrawDeposit(uint256 _price) public payable {
        require(
            ownersToDeposits[msg.sender] >= _price,
            "Enough funds not deposited!"
        );
        address to = payable(msg.sender);
        (bool sent, ) = to.call{value: _price}("");
        ownersToDeposits[msg.sender] -= _price;
        require(sent, "Could not complete the transaction");
        if (ownersToDeposits[msg.sender] < 1 ether) {
            _removeFromLineupSet(msg.sender);
        }
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
        return getTeamRating(msg.sender);
    }

    function getTeamRating(address _owner)
        public
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

    function getOpponent() public lineUpSet(msg.sender) returns (address) {
        require(lineupSet.length > 1, "Players not available!");
        getRandomNumber();
        randomResult = (randomResult % lineupSet.length) + 1;
        address opponent = lineupSet[randomResult - 1];
        if (msg.sender == opponent) {
            if (randomResult == lineupSet.length) {
                opponent = lineupSet[randomResult - 2];
            } else {
                opponent = lineupSet[randomResult];
            }
        }
        return opponent;
    }

    function play() external payable lineUpSet(msg.sender) {
        require(
            ownersToDeposits[msg.sender] >= 1 ether,
            "Does not have enough funds in deposits!"
        );
        address _opponent = getOpponent();
        uint256 teamRating = getTeamRating(msg.sender);
        uint256 opponentTeamRating = getTeamRating(_opponent);
        uint256 winProbability = 50;
        if (teamRating > opponentTeamRating) {
            winProbability = 50 + ((teamRating - opponentTeamRating) * 3);
        } else {
            winProbability = 50 - ((opponentTeamRating - teamRating) * 3);
        }
        getRandomNumber();
        randomResult = (randomResult % 100) + 1;
        if (randomResult <= winProbability) {
            ownerHistory[msg.sender].winCount++;
            ownerHistory[_opponent].lossCount++;
            ownersToDeposits[_opponent] -= 1 ether;
            if (ownersToDeposits[_opponent] < 1 ether) {
                _removeFromLineupSet(_opponent);
            }
            ownersToDeposits[msg.sender] += 0.5 ether;
        } else {
            ownerHistory[msg.sender].lossCount++;
            ownerHistory[_opponent].winCount++;
            ownersToDeposits[msg.sender] -= 1 ether;
            if (ownersToDeposits[msg.sender] < 1 ether) {
                _removeFromLineupSet(msg.sender);
            }
            ownersToDeposits[_opponent] += 0.5 ether;
        }
    }
}
