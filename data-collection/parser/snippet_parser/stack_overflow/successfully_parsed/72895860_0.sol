struct clothes {
    string name;
    string color;
}

clothes[5] public Clothes;

function addCloth(string calldata _name, string calldata _color) public {
    Clothes.push(clothes(_name,_color));
}
