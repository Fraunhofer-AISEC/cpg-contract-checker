   struct Info {
    uint a;
    uint256 b;
    uint[] data;
}

mapping(address => Info) infos;

function set() public {
    infos[msg.sender].a = 1;
    infos[msg.sender].b = 2;
    infos[msg.sender].data.push(3);
}

function get() public {
      infos[msg.sender].a; 
      infos[msg.sender].b; 
      infos[msg.sender].data[0]; 
}
