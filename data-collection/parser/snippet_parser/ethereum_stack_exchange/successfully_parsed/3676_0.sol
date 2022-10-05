mapping (address => uint) data;
function () payable {
    data[msg.sender] = msg.value;
}
