modifier restriction(){msg.sender == 0x123456}

function myFunction() private restriction { int a = 1; int b = 2

int c = a+b; }
