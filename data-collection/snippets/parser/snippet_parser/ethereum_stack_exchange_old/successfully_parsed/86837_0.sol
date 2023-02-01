pragma solidity ^0.5.0;
    
    contract ToDoList{
        
    int8 nItems;
    int8 public totalItems;
    struct Item{
        int8 id;
        string name;
    }
    mapping(int8=>Item) public items;
    
    constructor() public {
        nItems=0;
        totalItems=0;
    }
        function addItem(string memory name) public {
            nItems++;
            totalItems++;
            items[nItems]=Item(nItems,name);
        }
        function removeItem(int8 id) public {
            if(id<=nItems){
            items[id]=Item(0,"");
            totalItems--;   
            }
            
        }
        function getItem(int8 id) public returns(string memory){
            return items[id].name;
        }
    }
