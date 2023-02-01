uint[] private Info;

function SetInfo(uint[] memory data) private onlyOwner{
Info = new uint[](data.length);
for(uint i = 0; i < data.length;i++){
  Info[i] = data[i];
}


constructor(uint[] memory _Info,uint[] memory _SecondInfo)
ERC721(_name, _symbol) {
SetInfo(_Info);
SetSecondInfo(_SecondInfo)
}
