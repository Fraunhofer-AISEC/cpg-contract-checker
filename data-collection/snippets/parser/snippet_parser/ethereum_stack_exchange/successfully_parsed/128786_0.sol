   function RandomNft(string[] memory Uris) public {
        for (uint256 i = 0; i < Uris.length; i++) {
            while (true){
                uint a = getRandomNo();
                if (isUriAllotted[a]== false){
                    token_uri[a] = Uris[i];
                    isUriAllotted[a]==true;
                    break;
                }
                else{
                    continue;
                }
            }
        }
    }
