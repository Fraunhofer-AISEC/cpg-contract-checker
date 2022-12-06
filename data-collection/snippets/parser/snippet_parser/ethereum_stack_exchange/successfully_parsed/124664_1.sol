contract SoulKey is ERC721_bys{

bool private contractOnline;

mapping(uint => uint) private tokens;

uint private maximumNormalForAddress;
uint private maximumOpForAddress;

uint private normalMintLimit;
uint private opMintLimit;

event SoulContractOnline(bool _newStatus);


function mintSKN(uint amount) public payable{
    require(contractOnline, "You must wait before buying those keys");
    require(amount > 0, "The amount must be greater than zero");
    require(getNormalMinted() + amount < normalMintLimit, "Normal Keys were sold out!");
    require(normalBalanceOf(msg.sender) + amount < maximumNormalForAddress, "You cannot buy this amount of keys!");
    require(msg.value >= normalPrice * amount, "You must specify a greater amount!");
    _mint(msg.sender, amount);
    
    tokens[tokenSupply - 1] = 1;
}
function mintSKOP(uint amount) public payable{
    require(contractOnline, "You must wait before buying those keys");
    require(amount > 0, "The amount must be greater than zero");
    require(getOpMinted() + amount < opMintLimit, "OP Keys were sold out!");
    require(opBalanceOf(msg.sender) + amount < maximumOpForAddress, "You cannot buy this amount of keys!");
    require(msg.value >= opPrice * amount, "You must specify a greater amount!");
    _mint(msg.sender, amount);
    
    tokens[tokenSupply - 1] = 2;
}


function keyType(uint _tokenId) public view returns (uint){
    require(_tokenId < tokenSupply, "The specified token does not exists!");
    for(uint i = _tokenId; i < tokenSupply; i++){
        if(tokens[_tokenId] == 1){
            return 1;
        }else if(tokens[_tokenId] == 2){
            return 2;
        }
    }
    return 0;
}

function getNormalMinted() public view returns (uint){
    uint normalMinted;
    uint currentMinted;
    for(uint i; i < tokenSupply; i++){
        currentMinted++;
        if(tokens[i] != 0){
            if(tokens[i] == 1){
                normalMinted += currentMinted;
            }
            currentMinted = 0;
        }
    }
    return normalMinted;
}
function getOpMinted() public view returns (uint){
    uint opMinted;
    uint currentMinted;
    for(uint i; i < tokenSupply; i++){
        currentMinted++;
        if(tokens[i] != 0){
            if(tokens[i] == 2){
                opMinted += currentMinted;
            }
            currentMinted = 0;
        }
    }
    return opMinted;
}
function normalBalanceOf(address _address) public view returns (uint){
    uint balance;
    for(uint i; i < tokenSupply; i++){
        if(tokens[i] == 1 && ownerOf(i) == _address){
            balance++;
        }
    }
    return balance;
}
function opBalanceOf(address _address) public view returns (uint){
    uint balance;
    for(uint i; i < tokenSupply; i++){
        if(tokens[i] == 2 && ownerOf(i) == _address){
            balance++;
        }
    }
    return balance;
}
}
