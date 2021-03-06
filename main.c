#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int location[20]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
int locationPoriorty[80];
int binarySearch(char arr[], char x,int n);
void quickSortChar(char a[], int left, int right);
int SearchRequest(char request,char list1[],char list2[],char list3[],char list4[]);
void SearchRequestAndPoriorty(int poriority[],int NumPoriorty,char request );
void SearchPriority(char request,int poriority[]);
char list1[20];//this is part of memory
char list2[20];//this is part of memory
char list3[20];//this is part of memory
char list4[20];//this is part of memory
int main()
{

    int poriority[80]={0};
    int size=0;
    int s=1;
    int i;
    int numReq;
    printf("how many request you want to input ? ");
    scanf("%d",&numReq);
    for( i=0;i<numReq;i++)
    {
        printf("Enter request(a,b,c,d,etc .. ): ");
        if(size<20){
            scanf("%s",&list1[size]);
            printf("Enter priority (1,2,3,4): ");
            scanf("%d",&poriority[i]);
            if(poriority[i]>4){
                printf("you put priority failed please try again ! ");
                printf("Enter priority (1,2,3,4):");
                scanf("%d",&poriority[i]);
            }
        }
        if(size < 40 && size > 20)
        {
            scanf("%s",&list2[size-20]);
            printf("Enter priority (1,2,3,4): ");
            scanf("%d",&poriority[i]);
            if(poriority[i]>4){
                printf("you put priority failed please try again ! ");
                printf("Enter priority (1,2,3,4):");
                scanf("%d",&poriority[i]);
            }
        }
        if(size<60 && size>40){
            scanf("%s",&list3[size-40]);
            printf("Enter priority (1,2,3,4): ");
            scanf("%d",&poriority[i]);
            if(poriority[i]>4){
                printf("you put priority failed please try again ! ");
                printf("Enter priority (1,2,3,4):");
                scanf("%d",&poriority[i]);
            }
        }
        if(size < 80 && size > 60){
            scanf("%s",&list4[size-60]);
            printf("Enter priority(1,2,3,4) : ");
            scanf("%d",&poriority[i]);
            if(poriority[i]>4){
                printf("you put priority failed please try again !");
                printf("Enter priority (1,2,3,4):");
                scanf("%d",&poriority[i]);
            }
        }
        size++;
    }
    printf("|-----------------------The Main Functionalities --------------------------|\n");
    printf("1- search for Request \n");
    printf("2- search for Request Priority \n");
    printf("3- search for Request and Priority \n");
    printf("4- Delete all Request with specific Priority \n");
    printf("5- Process all requests with specific priority \n");
    printf("6- Empty all lists \n");
    while(s==1){
    printf("Enter your choice :");
    int choice;
    scanf("%d",&choice);
    if(choice==1){
        printf("Enter name of Request ");
        char input1;
        scanf("%s",&input1);
        int result=SearchRequest(input1,list1,list2,list3,list4);
        if(result!=-1)
        {
            printf("the request location is :%d ",result);
        }
    }
    else if(choice==2){
        printf("Enter name Request want to know Priority :");
        char input2;
        scanf("%s",&input2);
        SearchPriority(input2,poriority);
    }
    else if(choice==3){
        printf("Enter the name of Request :");
        char input3;
        scanf("%s",&input3);
        printf("Enter the Priority of Request:");
        int prior;
        scanf("%d",&prior);
        SearchRequestAndPoriorty(poriority,prior,input3);
    }
    else if(choice==4){
        delete_request(poriority);
    }
    else if(choice==5){
        printf("Enter number of Priority(1,2,3,4) :");
        int input4;
        scanf("%d",&input4);
        process_request(poriority,input4);
    }
    else if(choice==6){
        printf("Empty All successful");
        emptyAll();
    }
    else{
        printf("wrong choice");
    }
    printf("do you want 1-do another operation 2-exit\n");
    scanf("%d",&s);
    }
}
////////////////////////////////////////////////////////////
// ---this function is search request by binary search---//
//////////////////////////////////////////////////////////
int SearchRequest(char request,char list1[],char list2[],char list3[],char list4[]){
    int k;
    quickSortChar(list1,0,20);
    int result=binarySearch(list1,request,20);
    if(result!=-1){
        return location[result];
    }
    for(k=0;k<20;k++){
        location[k]=k;
    }
    quickSortChar(list2,0,20);
    result=binarySearch(list2,request,20);
    if(result!=-1){
        return location[result]+20;
    }
    for(k=0;k<20;k++){
        location[k]=k;
    }
    quickSortChar(list3,0,20);
    result=binarySearch(list3,request,20);
    if(result!=-1){
        return location[result]+40;
    }
    for(k=0;k<20;k++){
        location[k]=k;
    }
    quickSortChar(list4,0,20);
    result=binarySearch(list4,request,20);
    if(result!=-1){
        return location[result]+60;
    }
    printf("the request not found ! ");
}
////////////////////////////////////////////////////////////
// this function arrange request by quick sort algorithm //
//////////////////////////////////////////////////////////
void quickSortChar(char a[], int left, int right){
    int j;
    if (left < right)
    {
        j = partition(a, left, right);
        quickSortChar(a, left, j - 1);
        quickSortChar(a, j + 1, right);
    }
}
int partition(char a[], int left, int right){
    int pivot, i, j, t;
    pivot = a[left];
    i = left; j = right + 1;

    int temp_location;
    while (1)
    {
        do i++; while (a[i] <= pivot && i <= right);
        do j--; while (a[j] > pivot);
        if (i >= j) break;
        t = a[i];
        a[i] = a[j];
        a[j] = t;
        temp_location=location[i];
        location[i]=location[j];
        location[j]=temp_location;
    }
    t = a[left];
    a[left] = a[j];
    a[j] = t;
    temp_location=location[left];
    location[left]=location[j];
    location[j]=temp_location;
    return j;
}
//////////////////////////////////////////////////////////////////////////////////////
// this function is work only arrange request and search for request in the system //
////////////////////////////////////////////////////////////////////////////////////
int binarySearch(char arr[], char x,int n){
        int l = 0 ;
        int r = n - 1;
        while (l <= r)
        {
            int m = l + (r - l) / 2;
        int res;
        if (x == arr[m])
            res = 0;
            // Check if x is present at mid
            if (res == 0)
                return m;
            // If x greater, ignore left half
            if (x > (arr[m]))
                l = m + 1;
            // If x is smaller, ignore right half
            else
                r = m - 1;
        }
        return -1;
    }
///////////////////////////////////////////////////////
// delete request from system by known the priority //
/////////////////////////////////////////////////////
void delete_request(int poriority[]){
    int port;

    printf("Enter priority to Delete all request : ");
    scanf("%d",&port);
    //delete from list one
    for(int i=0;i<20;i++)
    {
        if(port==poriority[i]){
            printf("the request name [%c] has deleted from list[1] in location: %d\n",list1[i],i);
            list1[i]='\0';
            poriority[i]=0;

        }
    }
    //delete from list two
    for(int i=0;i<20;i++)
    {
        if(port==poriority[i+20]){
            printf("the request name [%c] has deleted from list[2] in location: %d\n",list2[i],i+20);
            list2[i]='\0';
            poriority[i+20]=0;
        }
    }
    //delete from list 3
    for(int i=0;i<20;i++)
    {
        if(poriority[i+40]==port){
            list3[i]='\0';
            printf("the request name [%c] has deleted from list[3] in location: %d\n",list3[i],i);
            poriority[i+40]=0;
        }
    }
    //delete from list 4
    for(int i=0;i<20;i++)
    {
        if(poriority[i+60]==port){
            printf("the request name [%c] has deleted from list[4] in location: %d\n",list4[i],i+60);
            list4[i]='\0';
            poriority[i+60]=0;
        }
    }
    printf("delete successful !");
}
////////////////////////////////////////////////////////////////////////////////
// this function is print requests by know the specific priority for request //
//////////////////////////////////////////////////////////////////////////////
void process_request(int poriority[],int port){
    //print list two
    for(int i=0;i<20;i++)
    {
        if(poriority[i]==port)
            {
                printf("Request name from list[1] : ");
                printf("%c\n",list1[i]);
            }
    }
    //print list two

    for(int i=0;i<20;i++)
    {
        if(poriority[i+20]==port)
            {
                printf("Request name from list[2]: ");
                printf("%c\n",list2[i]);
            }
    }
    //print list three
    for(int i=0;i<20;i++)
    {
        if(poriority[i+40]==port)
            {
                printf("Request name from list[3]: ");
                printf("%c\n",list3[i]);
            }
    }
    //print list four
    for(int i=0;i<20;i++)
    {
        if(poriority[i+60]==port)
           {
               printf("Request name from list[4]: ");
               printf("%c\n",list4[i]);
           }
    }
    printf("end successful !");
}
/////////////////////////////////////////////////////////
// this function is delete all request in the system ///
///////////////////////////////////////////////////////
void emptyAll(){
    for(int i=0;i<20;i++)
    {
        list1[i]='\0';
        list2[i]='\0';
        list3[i]='\0';
        list4[i]='\0';
    }
    printf("empty all successful !");
}
//////////////////////////////////////////////////////////////////////////////////
// this function is search by name of request and priority in the request have //
////////////////////////////////////////////////////////////////////////////////
void SearchRequestAndPoriorty(int poriority[],int NumPoriorty,char request ){
    int result=SearchRequest(request,list1,list2,list3,list4);
    if(poriority[result]==NumPoriorty){
        printf("the location of request  :");
        printf("%d",result);
    }
    else{
        printf("not found");
    }
}
///////////////////////////////////////////////
// this function is search priority by name //
/////////////////////////////////////////////
void SearchPriority(char request,int poriority[]){
    int result=SearchRequest(request,list1,list2,list3,list4);
    if(poriority[result]==1 || poriority[result]==2 || poriority[result]==3 || poriority[result]==4){
        printf("the priority of request is :");
        printf("%d",poriority[result]);
    }else{
    printf("not found priority for request !");
    }

}



