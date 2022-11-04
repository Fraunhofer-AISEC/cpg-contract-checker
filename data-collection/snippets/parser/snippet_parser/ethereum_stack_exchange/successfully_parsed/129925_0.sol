contract Dog {
   string name;
   constructor(string _name){
       name = _name;
   }
}

contract Human {
    Dog[] dogs;
    uint currDogs = 0;

    function addDog() public {
        dogs[currDogs] = new Dog("test");
        
        currDogs++;
    }
}
