function splice(string calldata source, int startPos, int numchars) public pure returns(string memory) {
        if (startPos > int(length(sourcestring))) return "";
        int start = startPos -1;
        int end = startPos + (numchars -1);
        string memory retval = string(source[uint(start) : uint(end)]);
        return retval;

    }
