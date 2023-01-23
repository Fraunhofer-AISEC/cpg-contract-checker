struct person{

    string name;
    uint age;
    address add;
    uint amount;
}
 
person public p1;
mapping(address=>person) public data1;



function map()public{
      data1[p1.add]=p1;

}


function structsetter()public {
    p1.name="rohit";
    p1.age=22;
    p1.add=0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    p1.amount=0;
 }    

 function setter() public {

     p1.amount=7;
     } 
