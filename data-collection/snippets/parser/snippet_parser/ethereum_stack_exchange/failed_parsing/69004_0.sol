mapping (address => Trade[]) private _Trade;
event tradeMade(address maker);
...
function createTrade(params...)
public{
    Trade newTrade = new Trade(params...); 
    _Trade[msg.sender].push(newTrade);     

    emit tradeMade(msg.sender);
}
