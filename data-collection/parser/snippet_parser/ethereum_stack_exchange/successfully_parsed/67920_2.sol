function getUserData(uint _id) public view returns (uint,string,string,uint,uint) { 
    
    uint id;
    string name;
    string class;
    uint age;
    uint pincode;

    (id, name, class, age, pincode) = r.getUser(_id);

    return(id, name, class, age, pincode);
}
