pragma solidity ^0.4.24;




contract Redpack {
    address public owner;

    uint public minPackAmount = 1 * (10 ** 18); 
    uint public maxPackAmount = 10000 * (10 ** 18); 
    uint public constant LIMIT_AMOUNT_OF_PACK = 100000 * (10 ** 18);

    uint public minPackCount = 1; 
    uint public maxPackCount = 10000; 

    uint public totalPackAmounts = 0; 
    uint public numberOfPlayers = 0; 
    address[] public players; 

    struct Player {
        uint id; 
        address owner; 
        uint amount; 
        uint balance; 
        uint count; 
        uint amountPerPack; 
        bool isRandom; 
        uint[] randomAmount; 
        uint randomFactor; 
        address[] hunterList; 
        mapping(address => uint) hunterInfo; 
    }

    
    mapping(uint => Player) public playerInfo;

    
    function() public payable {}
    
    
    
    
    


    
    
    
    constructor (uint _minPackAmount, uint _maxPackAmount) public {
        owner = msg.sender;

        if(_minPackAmount > 0) minPackAmount = _minPackAmount;
        if(_maxPackAmount > 0 && _maxPackAmount <= LIMIT_AMOUNT_OF_PACK)
            maxPackAmount = _maxPackAmount;
    }

    function kill() public {
        if(msg.sender == owner) selfdestruct(owner);
    }

    
    function getPlayerInfo() public view returns (
        uint nTotalPackAmounts,
        uint nNumberOfPlayers,
        address[] playerList
    ) {
        return (
        totalPackAmounts,
        numberOfPlayers,
        players
        );
    }

    
    
    

    event redpackCreated(uint id);
    event redpackWithdraw(uint amount);

    
    
    
    
    function toll(uint count, bool isRandom) public payable {
        require(msg.value >= minPackAmount && msg.value <= maxPackAmount, "amount out of range(1..10000");
        require(count >= minPackCount && count <= maxPackCount, "最少1个, 最多10000个");

        uint id = numberOfPlayers;
        playerInfo[id].amount = msg.value;
        playerInfo[id].balance = msg.value;
        playerInfo[id].count = count;
        playerInfo[id].isRandom = isRandom;
        playerInfo[id].id = id;
        if (isRandom) {
            uint total = 0;
            for (uint i = 0; i < count; i++) {
                playerInfo[id].randomAmount[i] = uint(keccak256(abi.encodePacked(now, msg.sender, i))) % 100;
                total += playerInfo[id].randomAmount[i];
            }
            playerInfo[id].randomFactor = 100 / total; 
        } else {
            playerInfo[id].amountPerPack = msg.value / count; 
        }

        totalPackAmounts += msg.value;
        numberOfPlayers++; 
        players.push(msg.sender); 

        emit redpackCreated(id);
    }

    
    
    function withdrawBalance(uint id) public {
        require(msg.sender == playerInfo[id].owner, "not the owner.");
        require(playerInfo[id].balance > 0, "balance is 0.");
        require(playerInfo[id].balance <= totalPackAmounts, "not enough budget.");

        msg.sender.transfer(playerInfo[id].balance);
        totalPackAmounts -= playerInfo[id].balance;

        emit redpackWithdraw(playerInfo[id].balance);
    }

    
    
    
    
    
    
    
    
    function getPackInfo(uint id) public view returns (
        uint amount,
        uint balance,
        uint count,
        uint amountPerPack,
        bool isRandom
    ) {
        Player storage player = playerInfo[id];
        return (
        player.amount,
        player.balance,
        player.count,
        player.amountPerPack,
        player.isRandom
        );
    }

    
    
    

    event redpackGrabbed(uint amount);

    
    
    
    function checkHunterExists(uint _id, address _hunter) public view returns(bool) {
        for (uint256 i = 0; i < playerInfo[_id].hunterList.length; i++){
            if(playerInfo[_id].hunterList[i] == _hunter) return true;
        }
        return false;
    }

    
    
    function hunting(uint id) public payable {
        
        require(playerInfo[id].balance > 0, "redpack is empty");
        require(playerInfo[id].count > playerInfo[id].hunterList.length, "exceed number of redpacks");
        require(!checkHunterExists(id, msg.sender), 'already grabbed');

        if(playerInfo[id].isRandom) {
            
            uint index = playerInfo[id].hunterList.length;
            uint value = playerInfo[id].randomFactor * playerInfo[id].randomAmount[index] * playerInfo[id].amount;
            if (playerInfo[id].hunterList.length + 1 >= playerInfo[id].count) {
                
                hunted(id, playerInfo[id].balance);
                playerInfo[id].balance = 0;

            } else {
                hunted(id, value);
                playerInfo[id].balance -= value;
            }
        } else {
            
            if (playerInfo[id].balance > playerInfo[id].amountPerPack) {
                
                if (playerInfo[id].balance < playerInfo[id].amountPerPack * 2) {
                    hunted(id, playerInfo[id].balance);
                    playerInfo[id].balance = 0; 
                } else {
                    
                    hunted(id, playerInfo[id].amountPerPack);
                    playerInfo[id].balance -= playerInfo[id].amountPerPack;
                }
            } else {
                
                hunted(id, playerInfo[id].balance);
                playerInfo[id].balance = 0;
            }
        }
    }
    function hunted(uint _id, uint _amount) internal {
        require(_amount <= totalPackAmounts, "grab: not enough budget.");
        msg.sender.transfer(_amount);
        totalPackAmounts -= _amount;
        playerInfo[_id].hunterList.push(msg.sender);

        emit redpackGrabbed(_amount);
    }

    
    
    

}
