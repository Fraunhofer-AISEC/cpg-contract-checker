contract Contract {

    struct User{
    string fname;
    string Email;
    uint256 age;
    }


    mapping(uint => User)public users; 


 function addDoctor(uint _id, string memory fname, string memory Email,
    uint256 age) public {


         users[_id] = User(fname,email,age);

     }
 }
