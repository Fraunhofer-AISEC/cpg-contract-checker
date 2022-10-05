        bytes memory number;
        bytes memory alpha;

        function getNumAndAlpha() public pure external returns( bytes n, bytes a){

        string memory str = "1jfjw2j34jcnsj512jdn3";

        bytes memory b = bytes(str);

        for(uint i=0; i< b.length; i++){

            if (b[i] == "0"  b[i] == "1"b[i] == "2"  b[i] == "2"  b[i] == "4" || b[i] == "5") {

                number += string(b[i]\n);

            } else {

                alpha += string(b[i]\n);
            }
        }
            return (number, alpha)

    } 
