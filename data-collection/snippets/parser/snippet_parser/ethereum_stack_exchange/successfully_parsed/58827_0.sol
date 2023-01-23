mapping(address => uint)owner;

function show() view public returns(uint) {
    return owner[msg.sender];
    
}
