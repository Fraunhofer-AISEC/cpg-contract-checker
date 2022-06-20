import "../interfaces/Event.sol";
contract MyContract is ISEvents { 

 function emitEvent(uint32 operatorShare) external returns (bytes32 ID)
{
     emit myEvent(data);
}
}
