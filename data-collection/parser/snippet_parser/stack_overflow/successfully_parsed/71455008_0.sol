struct courseDetails{
        string courseName;
        uint courseGrade;
        uint courseCredits;
        string courseResult;
    }

mapping(address=>mapping(uint=>courseDetails[])) private mapStudentCourse;

function viewCompletedCourses(address _student) public view restrictedAccess returns(courseDetails[] memory){
        uint _semNo;
        courseDetails[] memory sem = new courseDetails[](mapStudentCourse[_student][_semNo].length);
        
        for(_semNo=1; _semNo<mapStudentCourse[_student][_semNo].length; _semNo++){
            for(uint index=0; index<mapStudentCourse[_student][_semNo].length; index++){
                sem[index] = mapStudentCourse[_student][_semNo][index];
            }
        }
        return sem;
    }
