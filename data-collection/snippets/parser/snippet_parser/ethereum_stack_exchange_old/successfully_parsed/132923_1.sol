

interface ICRUD{ function readAllData() external view returns (Data[] memory); }

contract verifyData{

function read() external view returns (Data[] memory){
     Data[] data = ICRUD(0xd9145CCE52D386f254917e481eB44e9943F39138).readAllData();
     return data;
}
}
