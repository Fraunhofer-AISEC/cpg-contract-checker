contract Product{  
    struct prod{  
        string name;  
        uint id;  
        bool status;  
    }  
    mapping(uint => prod) public products;

    function updateStudent (string n, uint ID) {
      products[ID].n = "Temp";
      products[ID].status = true;
    }
}
