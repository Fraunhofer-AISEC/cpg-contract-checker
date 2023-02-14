 struct idea_info {
    string code;
    string title;
    string description;
    address ideaOwner;
    address [] investors;
    uint amount;
}

idea_info [] ideas_arr; 

constructor() {
    ideatorObj = new Ideator( address(this) );
    investorObj = new Investor( address(this) );
}

function saveIdea(string calldata _code, string calldata _title, string calldata _description, address _account) public {
    idea_info memory idea;
    idea.code = _code;
    idea.title = _title;
    idea.description = _description;
    idea.ideaOwner = _account;
    idea.amount = 0;
    ideas_arr.push(idea);
}

 function getIdeasByIdeatorAddress(address _account) public view returns(idea_info memory tempIdea) {
     for(uint8 i=0; i<ideas_arr.length; i++) {
         if( ideas_arr[i].ideaOwner == _account ) {
             return ideas_arr[i];
         }
     }
}

function getIdeas() public view returns(idea_info [] memory) {
    return ideas_arr;
}

function getIdeaByCode(string calldata _code) public view returns(idea_info memory tempIdea) {
    for(uint8 i=0; i<ideas_arr.length; i++) {
        if( keccak256(bytes(ideas_arr[i].code)) == keccak256(bytes(_code))) {
            return ideas_arr[i];
        }
    }
}


function receiveIdeaDonations(string calldata _code, uint _amount, address _account) public {
    for(uint8 i=0; i<ideas_arr.length; i++) {
        if( keccak256(bytes(ideas_arr[i].code)) == keccak256(bytes(_code)) ) {
            ideas_arr[i].investors.push(_account);
            ideas_arr[i].amount += _amount;
        }
    }
}


function getIdeaCodes() public view returns(string [] memory codes) {
    codes = new string[](ideas_arr.length);
    for(uint8 i=0; i<ideas_arr.length; i++) {
        codes[i] = ideas_arr[i].code;
    }
    return codes;
}

function getIdeaOnInvestor(address _account) public view returns(idea_info memory investorIdea) {
    for(uint8 i=0; i<ideas_arr.length; i++) {
        for(uint8 j=0; j<ideas_arr[i].investors.length; j++) {
            if( ideas_arr[i].investors[j] == _account ) {
                return ideas_arr[i];
            }
        }
    }
}

function getIdeatorContractAddress() public view returns(address ideatorAddr) {
    ideatorAddr = address(ideatorObj);
}

function getInvestorContractAddress() public view returns(address investorAddr) {
    investorAddr = address(investorObj);
}
