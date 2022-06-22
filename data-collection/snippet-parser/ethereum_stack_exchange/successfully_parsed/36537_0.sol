struct Model {
        uint a;
        uint b;
        uint c;
        uint d;
    }

Model[] private _models;

function _create(uint dna) private returns(uint) {
    uint a = uint(keccak256(dna, "a")) % 10 ** 2;
    uint b =  uint(keccak256(dna, "b")) % 10 ** 2;
    uint c = uint(keccak256(dna, "c")) % 10 ** 2;
    uint d = 1;
    return _models.push(Model(a,b,c,d)) - 1;
}

function _generate() private {
    for(uint x=0; x<10; x++){
        uint dna = uint(keccak256(now, msg.sender, x)) % 10 ** 2;
        uint id = _create(dna);
        Owners[id] = msg.sender;
        decks[msg.sender].push(cardId);
    }
}
