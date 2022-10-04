  enum Gender { Male, Female }
  enum Status {New,Pending,Validated,ToRevalid}


function getPerson(bytes32 personAddress)
    public

    constant
    returns(bytes32,
    bytes32 email,
    bytes32 fname,
    bytes32 lname,
    uint index,
    bool deleted,
    Gender gender,
    string image,
    Status status,
    bytes32[13] details
    )
  {
    if(!isPerson(personAddress)) return;
    else{
      if(persons[personAddress].deleted == true) return;
      else{

      details[0]=persons[personAddress].RIM;
      details[1]=persons[personAddress].BirthCity;
      details[2]=persons[personAddress].BirthCountry;
      details[3]=persons[personAddress].FatherName;
      details[4]=persons[personAddress].MotherName;
      details[5]=persons[personAddress].Citizenship;
      details[6]=persons[personAddress].Residency;
      details[7]=persons[personAddress].Grade;
      details[8]=persons[personAddress].CorpCountryCode;
      details[9]= persons[personAddress].IntroducedBy;
      details[10]=persons[personAddress].HowIntroduced;
      details[11]=persons[personAddress].website;
      details[12]=persons[personAddress].DeceasedDate;
        return(
          personAddress,
          persons[personAddress].email,
          persons[personAddress].fname,
          persons[personAddress].lname,
          persons[personAddress].index,
          persons[personAddress].deleted,
          persons[personAddress].gender,
          persons[personAddress].image,
          persons[personAddress].status,
          details
        );
      }
    }

  }
