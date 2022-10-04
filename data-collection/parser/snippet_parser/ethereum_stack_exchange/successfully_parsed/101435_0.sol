contract Messenger {
    struct Targaryen
    {
        bool registered;
        string uname;
        uint coins;
        Dragon[] dragons;
    }

    mapping(address => Targaryen) public targaryens;
    
    function register(string calldata uname) external returns(bool)
    {
        Targaryen storage t = targaryens[msg.sender];
        if(!t.registered)
        {
            t.registered = true;
            t.uname = uname;
            t.coins = 100;
            t.dragons = defaultDragons;

            return true;
        }
        return false;
    }

    function sellDragon(address buyer, uint dragon) public returns (bool)
    {
        if(targaryens[msg.sender].registered && targaryens[buyer].registered) 
        {
            if (dragon >= targaryens[msg.sender].dragons.length) return false;
            if (targaryens[msg.sender].dragons[dragon].rarity > targaryens[buyer].coins) return false;
            
            Dragon memory toSell = targaryens[msg.sender].dragons[dragon];
            targaryens[msg.sender].coins += toSell.rarity;
            
            removeDragon(msg.sender, dragon);
            
            targaryens[buyer].dragons.push(toSell);
            targaryens[buyer].coins -= toSell.rarity;
            
            return true;
        }
        return false;
    }

}
