



pragma solidity >=0.7.0 <0.9.0;

struct Information {
    uint number;
    string avatar;
}

abstract contract AbstractCandidate {
    uint[6] private _numbers = [1, 2, 3, 4, 5, 6];
    string[6] private _avatars = [
        "https://raw.githubusercontent.com/thiagosaud/dApp-superior-electoral-court/main/temp/imgs/candidate-1.png",
        "https://raw.githubusercontent.com/thiagosaud/dApp-superior-electoral-court/main/temp/imgs/candidate-2.png",
        "https://raw.githubusercontent.com/thiagosaud/dApp-superior-electoral-court/main/temp/imgs/candidate-3.png",
        "https://raw.githubusercontent.com/thiagosaud/dApp-superior-electoral-court/main/temp/imgs/candidate-4.png",
        "https://raw.githubusercontent.com/thiagosaud/dApp-superior-electoral-court/main/temp/imgs/candidate-5.png",
        "https://raw.githubusercontent.com/thiagosaud/dApp-superior-electoral-court/main/temp/imgs/candidate-6.png"
    ];

    modifier checkNumber(uint _number) {
        string memory _errorMessage = "Candidate number is incorret!";

        require(_number < 1 || _number > _numbers.length, _errorMessage);

        if (_number < 1 || _number > _numbers.length) {
            revert(_errorMessage);
        }

        _;
    }

    function getInformation(uint _number) external view checkNumber(_number) returns(Information memory) {
        return Information({ avatar: _avatars[_number], number: _numbers[_number] });
    }
}
