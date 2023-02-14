function loadNewRandomNumbers() public payable {
    oraclizeID = oraclize_query("WolframAlpha", "10 unique random numbers between 0 and 100");
}
