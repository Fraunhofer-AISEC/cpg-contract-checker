mapping(uint => uint) public myMap;

function store(uint key, uint val) public {
   myMap[key]=val;
}

function retrieve(uint key) public view returns (uint){
    return myMap[key];
}
