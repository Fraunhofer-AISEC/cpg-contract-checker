 
    pragma solidity ^0.8.0;
    
    contract EvacDAO {
        struct EvacuationMap {
            address submitter;
            string mapData;
            bool isValid;
        }
    
        mapping(uint256 => EvacuationMap) public maps;
        mapping(address => uint256) public stakes;
        mapping(address => bool) public hasSubmitted;
    
        uint256 public mapCount;
        uint256 public votingPeriod;
        uint256 public feePercentage;
        uint256 public slashingPercentage;
    
        constructor(uint256 _votingPeriod, uint256 _feePercentage, uint256 _slashingPercentage) {
            votingPeriod = _votingPeriod;
            feePercentage = _feePercentage;
            slashingPercentage = _slashingPercentage;
        }
    
        function submitMap(string memory _mapData) external {
            require(!hasSubmitted[msg.sender], "You have already submitted a map.");
    
            uint256 currentMapCount = mapCount;
            maps[currentMapCount] = EvacuationMap(msg.sender, _mapData, false);
            hasSubmitted[msg.sender] = true;
            mapCount++;
    
            
            stakes[msg.sender] += 1 ether;
        }
    
        function validateMap(uint256 _mapId, bool _isValid) external {
            require(msg.sender != maps[_mapId].submitter, "Cannot validate your own map.");
    
            
            maps[_mapId].isValid = _isValid;
    
            
            if (_isValid) {
                uint256 fee = (feePercentage * 1 ether) / 100;
                uint256 reward = (fee * stakes[msg.sender]) / totalStakes();
                payable(msg.sender).transfer(reward);
            } else {
                
                uint256 slashingFee = (slashingPercentage * 1 ether) / 100;
                uint256 slashAmount = (slashingFee * stakes[msg.sender]) / totalStakes();
                stakes[msg.sender] -= slashAmount;
            }
        }
    
        function totalStakes() internal view returns (uint256) {
            uint256 total = 0;
            for (uint256 i = 0; i < mapCount; i++) {
                total += stakes[maps[i].submitter];
            }
            return total;
        }
    
        function executeVoting(uint256 _mapId) external {
            require(!maps[_mapId].isValid, "Map is already approved.");
            require(block.timestamp >= votingPeriod, "Voting period has not ended.");
    
            uint256 approvalVotes;
            uint256 rejectionVotes;
    
            
            for (uint256 i = 0; i < mapCount; i++) {
                if (i != _mapId) {
                    if (maps[i].isValid) {
                        approvalVotes += stakes[maps[i].submitter];
                    } else {
                        rejectionVotes += stakes[maps[i].submitter];
                    }
                }
            }
    
            
            if (approvalVotes > rejectionVotes) {
                maps[_mapId].isValid = true;
    
                
                uint256 fee = (feePercentage * 1 ether) / 100;
                uint256 reward = (fee * stakes[maps[_mapId].submitter]) / totalStakes();
                payable(maps[_mapId].submitter).transfer(reward);
            } else {
                
                uint256 slashingFee = (slashingPercentage * 1 ether) / 100;
                uint256 slashAmount = (slashingFee * stakes[maps[_mapId].submitter]) / totalStakes();
                stakes[maps[_mapId].submitter] -= slashAmount;
            }
    
        }
        
        function correctMap(uint256 _mapId) external {
            require(maps[_mapId].isValid, "Map is not approved.");
    
            
            uint256 fee = (feePercentage * 1 ether) / 100;
            uint256 reward = (fee * stakes[msg.sender]) / totalStakes();
            payable(msg.sender).transfer(reward);
        }
    
        
        function reportInvalidMap(uint256 _mapId) external {
            require(maps[_mapId].isValid, "Map is not approved.");
    
            
            uint256 slashingFee = (slashingPercentage * 1 ether) / 100;
            uint256 slashAmount = (slashingFee * stakes[msg.sender]) / totalStakes();
            stakes[msg.sender] -= slashAmount;
        }
    }
