 pragma solidity ^0.8.0;
    
    contract GpCalculator{
    
        string CourseName;
        uint Unit;
        uint Score;
    
    struct Details{
        string CourseName;
        uint Unit;
        uint Score;
        }
     
    Details[] public details;



function addCourseDetails(string memory _CourseName, uint _Unit, uint _Score)public{
    details.push(Details(CourseName = _CourseName, Unit = _Unit, Score = _Score));
    }




function retrieveDetails()public view returns(string memory, uint, uint){
    return(CourseName, Unit, Score);}



function retrieveGrade() public view returns(string memory){
    if (Score >69 && Score<=100){
        return("A");
        } else if (Score >59 && Score<=69){
            return ("B");
            } else if (Score >49 && Score<=59){
                return ("C");
                }else if (Score >45 && Score<=49){
                    return ("D");
                    }else if (Score <45 && Score >=30){
                        return ("E");
                        }else if(Score <30){
                            return ("Retake this course!");
                            }else {
                        return ("Imposible");
                    }
    


function calculatePoint()public view returns(uint G){
    if (Score >69 && Score <=100){
        G = 4;
    }else if (Score >59 && Score<=69){
        G = 3;
    }else if (Score >49 && Score<=59){
        G = 2;
    }else if (Score >45 && Score<=49){
        G = 1;
    }else if (Score <=44){
        G = 0;
    }else{
        G = 0;
    }
    return(Unit * G);
    }


}
