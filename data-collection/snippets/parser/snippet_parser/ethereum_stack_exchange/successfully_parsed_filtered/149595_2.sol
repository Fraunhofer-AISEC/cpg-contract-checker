function isRandomNumberUpdate() public view returns (bool status) {
        if (s_randomWords.length > 0) return true;
        else return false;
    }
