contract Idk {
    Thing[] deployedThings;

    function createSomething(address  _name) public {
        Thing newThing=new Thing(_name);
        deployedThings.push(newThing);
    }

    function seeThings() public view returns(Thing[] memory){
        return deployedThings;
    }

}

contract Thing {
    
    address name;
    constructor(address _name ) {
        name= _name;  
    }

    function sendEth() public payable {
        require(msg.value==1 ether);
        payable(name).send(0.2 ether);
    }
 }
