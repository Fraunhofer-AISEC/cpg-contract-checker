struct Questions{

        bool areNice;

        bool areCool;
    }
    

   Questions[] internal answers;

   function AnswerTrueFalseOnly (address _user, bool _areNice,
        bool _areCool) external {
       answers.push(Questions( _areNice,
        _areCool));

        if (_areNice == true) if (_arecool == true)  {
        return addscore(_user, _score);
        
    }
}