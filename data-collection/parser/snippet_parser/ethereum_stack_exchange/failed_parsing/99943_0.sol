contract Dragon
{
    enum Element { Fire, Water, Air, Earth }
    
    string public name;
    Element[] public element;
    uint public rarity;
    
    constructor (string memory _name, Element[] memory _element, uint _rarity) public
    {
        name = _name;
        element = _element;
        rarity = _rarity;
    }
    
    function breed (Dragon a, Dragon b) public view returns(Dragon)
    {
        Element[] memory newElement;
        for (int i = 0; i < a.element.length; i++) <-- the problem is here
        {
            newElement.push(a.element[i]);
        }
        for(int i = 0; i < b.element.length; i++) <-- I guess it is here as well but the compiler gets stuck on the one above first
        {
            for (int j = 0; j < newElement.length; j++)
            {
                if (b.element[i] != newElement[j])
                {
                    newElement.push(b.element[i]);
                }
            }
        }
        
        string memory newName = "";
        for(int i = 0; i < newElement.length; i++)
        {
            newName += newElement[i] + "-";
        }
        newName += "Dragon";
        
        return new Dragon(newName, newElement, a.rarity+b.rarity);
    }
}

 
