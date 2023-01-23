interface IAnimal {
    function makeSound() external;
}

contract Dog is IAnimal {
    function makeSound() external {
        
        
    }
}

contract Cat is IAnimal {
    function makeSound() external {
        
        
    }
}

contract Vet {

    function treatAnimal(address _animalAddress) public {
        
        
        IAnimal animal = IAnimal(_animalAddress);
        animal.makeSound();
    }

}
