contract MrHungry {

    uint oranges = 2;
    uint apples = 0;

    modifier checkOrangeStock() {
        require(oranges > 0);
        _;
    }

    modifier checkAppleStock() {
        require(apples > 0);
        _;
    }

    function eatStuff() public {
        eatOranges();
        eatApples();
    }

    function eatOranges() private checkOrangeStock {
        oranges--;
    }

    function eatApples() private checkAppleStock {
        apples--;
    }
}
