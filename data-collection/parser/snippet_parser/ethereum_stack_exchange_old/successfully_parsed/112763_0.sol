    mapping(address => address[]) public datas;


function addData(address data) public {
    datas[msg.sender].push(data);
}

function getDataLength() view public returns (uint256){
    return datas[msg.sender].length;
}
