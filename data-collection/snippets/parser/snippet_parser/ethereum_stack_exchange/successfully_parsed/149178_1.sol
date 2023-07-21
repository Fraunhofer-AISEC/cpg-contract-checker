mapping (uint256 =>string) public example;
    string fruit;

    constructor(){
        example[0]="apple";
        example[1]="peach";
        fruit = example[1];
    }
