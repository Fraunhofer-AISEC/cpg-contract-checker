contract Dog {
    function woof() external {
        
        
    }
}

contract Cat {
    function meow() external {
        
        
    }
}

contract Vet {

    function treatDog(address _dogAddress) public {
        Dog dog = Dog(_dogAddress);
        dog.woof();
    }

    function treatCat(address _catAddress) public {
        Cat cat = Cat(_catAddress);
        cat.meow();
    }

}
