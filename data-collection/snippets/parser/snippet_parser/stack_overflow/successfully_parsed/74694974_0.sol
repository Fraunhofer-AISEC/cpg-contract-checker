mapping(uint => Info) private infos;

struct Info {
    uint _id;
    address _add;
}

function getInfo(uint _infoid) external view returns (uint, address) {
    return infos[_infoid]; 
}
