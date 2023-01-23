#include <stdio.h>
struct student
{
    char name[50];
    int roll;
};

void display(struct student stu);


int main()
{
    struct student stud;
    printf("Enter student's name: ");
    scanf("%s", &stud.name);
    printf("Enter roll number:");
    scanf("%d", &stud.roll);
    display(stud);   
    return 0;
}
void display(struct student stu){
  printf("Output\nName: %s",stu.name);
  printf("\nRoll: %d",stu.roll);
}
