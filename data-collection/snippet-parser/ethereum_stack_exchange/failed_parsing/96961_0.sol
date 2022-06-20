
function randomNumber() private view returns(uint) {
    return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, nonce)));
}


function generateRandomCategory() private returns(uint8) {
    nonce++;
    uint randNumber = randomNumber();
    
    
    
    
    
    uint rarityChoice = randNumber % 32;
    if(rarityChoice <= 15) { return uint8(randNumber%2);     }   
    if(rarityChoice <= 28) { return uint8(randNumber%2)+2;   }   
    return uint8(randNumber%2)+4;  
}

event NewBot(uint16 indexed _id, uint8 level, uint8 head, uint8 body, uint8 l_arm, uint8 r_arm, uint8 l_leg, uint8 r_leg);


function mintBot(uint amount) public payable {
    require(amount > 0, "You must mint atleast one bot.");
    
    
    for(uint i = 0; i < amount; i++) {
        uint8 head = generateRandomCategory();
        uint8 body = generateRandomCategory();
        uint8 l_arm = generateRandomCategory();
        uint8 r_arm = generateRandomCategory();
        uint8 l_leg = generateRandomCategory();
        uint8 r_leg = generateRandomCategory();
        uint16 _id = uint16(mint(msg.sender));
        bitsMapping[_id] = [head, body, l_arm, r_arm, l_leg, r_leg, uint8(1)];
        emit NewBot(_id, uint8(1), head, body, l_arm, r_arm, l_leg, r_leg);
    }
}
