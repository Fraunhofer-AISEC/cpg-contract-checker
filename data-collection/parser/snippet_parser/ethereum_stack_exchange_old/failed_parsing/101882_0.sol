pragma solidity ^0.6.0;
contract Aion2  {
using SafeMath for uint256;

address public owner;
uint256 public serviceFee;
uint256 public AionID;
uint256 public feeChangeInterval;
mapping(address => address) public clientAccount;
mapping(uint256 => bytes32) public scheduledCalls;


event ExecutedCallEvent(address indexed from, uint256 indexed AionID, 
bool TxStatus, bool 
TxStatus_cancel, bool reimbStatus);

                        
event ScheduleCallEvent(uint256 indexed blocknumber, address indexed 
from, address to, uint256 
value, uint256 gaslimit,
                        uint256 gasprice, uint256 fee, bytes data, 
uint256 indexed AionID, 
bool schedType);

                       
event CancellScheduledTxEvent(address indexed from, uint256 Total, bool 
Status, uint256 
indexed AionID);

event feeChanged(uint256 newfee, uint256 oldfee);

constructor () public {
    owner = msg.sender;
    serviceFee = 500000000000000;
}    


function transferOwnership(address newOwner) public {
    require(msg.sender == owner);
    withdraw();
    owner = newOwner;
}


function createAccount() internal {
    if(clientAccount[msg.sender]==address(0x0)){
     newContract = AionClient(address(this));
        clientAccount[msg.sender] = address(newContract);
    }
} 
value + gaslimit*gasprice + serviceFee

function ScheduleCall(uint256 blocknumber, address to, uint256 value, 
uint256 gaslimit, 
uint256 gasprice, bytes memory data, bool schedType) public payable 
returns (uint,address){
    require(msg.value == 
value.add(gaslimit.mul(gasprice)).add(serviceFee));
    AionID = AionID + 1;
    scheduledCalls[AionID] = keccak256(abi.encodePacked(blocknumber, 
msg.sender, to, value, 
 gaslimit, gasprice, serviceFee, data, schedType));
    createAccount();
    clientAccount[msg.sender].transfer(msg.value);
    emit ScheduleCallEvent(blocknumber, msg.sender, to, value, gaslimit, 
 gasprice, serviceFee, 
 data, AionID, schedType);
    return (AionID,clientAccount[msg.sender]);
 }

    function executeCall(uint256 blocknumber, address from, address to, 
    uint256 value, uint256 
    gaslimit, uint256 gasprice,
                     uint256 fee, bytes calldata data, uint256 aionId, 
    bool schedType) 
    external {
    require(msg.sender==owner);
    if(schedType) require(blocknumber <= block.timestamp);
    if(!schedType) require(blocknumber <= block.number)
 
 
require(scheduledCalls[aionId])==keccak256(abi.encodePacked(blocknumber, 
from, to, value, 
    gaslimit, gasprice, fee, data, schedType));
    AionClient instance = AionClient(clientAccount[from]);
    
    require(instance.execfunct(address(this), gasprice*gaslimit+fee, 
2100, hex"00"));
    bool TxStatus = instance.execfunct(to, value, gasleft().sub(50000), 
data);
    
    
    bool TxStatus_cancel;
    if(!TxStatus && value>0){TxStatus_cancel = instance.execfunct(from, 
value, 2100, 
    hex"00");}
    
    delete scheduledCalls[aionId];
    bool reimbStatus = 
    from.call.value((gasleft()).mul(gasprice)).gas(2100)();
    emit ExecutedCallEvent(from, aionId,TxStatus, TxStatus_cancel, 
    reimbStatus);
    
    }
    function cancellScheduledTx(uint256 blocknumber, address from, 
    address to, uint256 value, 
    uint256 gaslimit, uint256 gasprice,uint256 fee, bytes calldata data, 
    uint256 aionId, bool 
    schedType) external returns (bool){
    if(schedType) require(blocknumber >=  block.timestamp+(3 minutes) || 
    blocknumber <= 
    block.timestamp-(5 minutes));
    if(!schedType) require(blocknumber >  block.number+10 || blocknumber 
    <= block.number-20);
require(scheduledCalls[aionId])==keccak256(abi.encodePacked(blocknumber, 
    from, to, value, 
    gaslimit, gasprice, fee, data, schedType));
    require(msg.sender==from);
    AionClient instance = AionClient(clientAccount[msg.sender]);
    
    bool Status = instance.execfunct(from, value+gasprice*gaslimit+fee, 
    3000, hex"00");
    require(Status);
    emit CancellScheduledTxEvent(from, value+gasprice*gaslimit+fee, 
    Status, aionId);
    delete scheduledCalls[aionId];
    return true;
}

function withdraw() public {
    require(msg.sender==owner);
    owner.transfer(address(this).balance);
}
function updatefee(uint256 fee) public{
    require(msg.sender==owner);
    require(feeChangeInterval<block.timestamp);
    uint256 oldfee = serviceFee;
    if(fee>serviceFee){
        require(((fee.sub(serviceFee)).mul(100)).div(serviceFee)<=10);
        serviceFee = fee;
    } else{
        serviceFee = fee;
    }
    feeChangeInterval = block.timestamp + (1 minutes);
    emit feeChanged(serviceFee, oldfee);
} 
function scheduleMyfucntion() public {
    aion = Aion(0xFcFB45679539667f7ed55FA59A15c8Cad73d9a4E);
    bytes memory data = 
abi.encodeWithSelector(bytes4(keccak256('myfucntion()')));
    uint callCost = 200000*1e9 + aion.serviceFee();
    

*aion.ScheduleCall{value:callCost}( block.timestamp + 1 minutes, 
address(this), 0, 200000, 
1e9, data, true);*
