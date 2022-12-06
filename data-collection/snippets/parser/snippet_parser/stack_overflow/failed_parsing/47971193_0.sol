struct Block {
    address owner;
    uint fromX;
    uint fromY;
    uint toX;
    uint toY;
    string imageUrl;
    string redirectUrl;
    string text;
    bool removed;
}   

uint size = 100;
mapping (uint => uint) unitsToState;
Block[] public blocks;
uint public areaPrice;
uint public areaPerUnit;

...


function buy(uint fromX, uint fromY, uint toX, uint toY, string imageUrl, string redirectUrl, string text) payable public {
    require(fromX >= 0);
    require(fromY >= 0);
    require(fromX <= toX);
    require(fromY <= toY);
    require(toX < size);
    require(toY < size);

    
    for (uint i = fromX; i <= toX; i++) {
        for (uint j = fromY; j <= toY; j++) {
            require(getUnitsToState(i*size*size + j) == 0);
        }    
    }

    uint width = toX - fromX + 1;
    uint height = toY - fromY + 1;
    uint areaCount = width * height * areaPerUnit;
    uint price = areaCount * areaPrice;
    require(msg.value >= price);

    Block memory b = Block(
       msg.sender,
       fromX,
       fromY,
       toX,
       toY,
       imageUrl,
       redirectUrl,
       text,
       false
    );
    blocks.push(b);

    
    for (i = fromX; i <= toX; i++) {
        for (j = fromY; j <= toY; j++) {
            unitsToState[i*size*size + j] = 1;
        }    
    }
}

...
