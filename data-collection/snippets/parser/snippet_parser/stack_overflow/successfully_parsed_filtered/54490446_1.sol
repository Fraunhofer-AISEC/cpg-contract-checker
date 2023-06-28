pragma solidity ^0.5.2;

contract PlayerChannel {

    struct Player
    { 
        uint PlayerId;
        address payable userAddr; 
    }
    struct Channel
    {
        uint[] playerCount;
        uint ChannelList; 
        mapping(uint => Player) playerStructs;
        Player player;
    }

    mapping(uint => Channel) channelStructs;
    uint[] allChannels;

    
    function newChannel(uint chanelnumber) public returns(bool success)
    {
        
        for(uint i =1; i <=chanelnumber; i++){
            require(channelStructs[chanelnumber].ChannelList != i );
        }
        channelStructs[chanelnumber].ChannelList = chanelnumber;
        allChannels.push(chanelnumber);
        return true;
    }

    
    function getChannel(uint chanelnumber) public view returns(uint playerCounts)
    {
        
        uint channelNum = channelStructs[chanelnumber].ChannelList;
        if(channelNum != 0){
            return(channelStructs[chanelnumber].playerCount.length);
        }
        else{
            revert("Channel is not created!!");
        }
    }

    
    function addPlayer(uint chanelnumber,uint playerId) public returns(bool message)
    {
        
        uint channelNum = channelStructs[chanelnumber].ChannelList;
        if(channelNum != 0){
            uint playerCounter = channelStructs[chanelnumber].playerCount.length;
            if(playerCounter < 3){
                channelStructs[chanelnumber].playerCount.push(playerId);
                channelStructs[chanelnumber].playerStructs[playerId].userAddr = msg.sender;
                channelStructs[chanelnumber].playerStructs[playerId].PlayerId = playerId;
                return true;
            }
            else{
                revert("Enter in new Channel, its full!!");
            }
        }
        else{
            revert("Channel is not created!!");
        }
    }
}
