contract Test {

    uint[] private grid;
    uint width = 5;
    uint height = 10;

    constructor() { 
        grid = new uint[width * height];
    }
}
