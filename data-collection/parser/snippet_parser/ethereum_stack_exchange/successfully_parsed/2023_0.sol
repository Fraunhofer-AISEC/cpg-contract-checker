struct Key
{
    bytes32 blindedKey;
    uint deposit;
    address player;
    bool revealed;
}
mapping(address => Key[]) public keys;

function seating(bytes32 _blindedKey)
    onlyBefore(seatingEnd)
    {
    
    keys[msg.sender].push(Key({
        blindedKey: _blindedKey,
        deposit: msg.value,
        player: msg.sender,
        revealed: false
    }));
}