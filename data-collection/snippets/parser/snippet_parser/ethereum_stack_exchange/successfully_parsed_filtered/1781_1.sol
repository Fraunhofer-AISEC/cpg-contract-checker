address payable x = 0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF;
if (address(x).balance < address(this).balance) 
    address(x).transfer(10);
