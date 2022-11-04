contract cat {

    uint id = 0;
    mappung(uint => Cat) idToCat;

    struct Cat {
        string name;
        uint age;
        uint babys;
    }

    function aNewCatIsBorn(string _name) {
        Cat memory cat;
        cat.name = _name;
        cat._age = 0;
        cat.babys = 0;
        idToCat[id] = cat;
        id += 1;
    }
    
    function getCatById(uint _id) public view retruns(Cat memory cat){
        return idToCat[_id];
    }   
}
