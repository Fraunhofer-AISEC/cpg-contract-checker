function newTranslation(string str, uint lang1, uint lang2) payable returns (uint translationID) {
    if (msg.value > 0) {
        translationID = translations.length;
        Translation memory t; 

        t.originAddress = msg.sender;
        t.originStr = str;
        t.originLanguage = lang1;
        t.destLanguage = lang2;
        t.bounty = msg.value;  
        t.time = now;
        t.completed = false;

        translations.push(t);
        numTranslations++;
    }
}
