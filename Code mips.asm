.data 
location : .word 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19
locationporiority : .space 320
list1 : .space 20
list2 : .space 20
list3 : .space 20
list4 : .space 20
poriority : .space 320
i : .word 0
size : .word 0
msg1 : .asciiz "\nhow many request you want to input ?"
msg2 : .asciiz "\nEnter request(a,b,c,d,etc .. ): "
msg3 : .asciiz "\n Enter priority (1,2,3,4): "
msg4 : .asciiz "\nyou put priority failed please try again ! "
msg5 : .asciiz "|-----------------------The Main Functionalities --------------------------|\n"
msg6 : .asciiz "1- search for Request \n"
msg7 : .asciiz "2- search for Request Priority \n"
msg8 : .asciiz "3- search for Request and Priority \n"
msg9 : .asciiz "4- Delete all Request with specific Priority \n"
msg10 : .asciiz "5- Process all requests with specific priority \n"
msg11 : .asciiz "6- Empty all lists \n"
msg12 : .asciiz "Enter your choice :\n"
msg13 : .asciiz "Enter name of Request\n "
msg14 : .asciiz "\nthe request location is :\n"
msg15 : .asciiz "Enter name Request want to know Priority :\n"
msg16 : .asciiz "Enter the Priority of Request:\n"
msg17 : .asciiz "Enter number of Priority(1,2,3,4) :\n"
msg18 : .asciiz "Empty All successful\n"
msg19 : .asciiz "wrong choice\n"
msg20 : .asciiz "\ndo you want 1- do another operation 2- exit\n"
.text
#---------- the main function -------------# 
main :
lw $t0,i #t0 = iterator
lw $t1,size #t1 is size
li $v0,4
la $a0,msg1
syscall
li $v0,5 #get numreq from user
syscall
add $s0,$0,$v0 #$s0 =numreq
addi $s0,$s0,-1 #start with index 0 so numreq -1
loop:
bgt $t0,$s0,endloop #if i > numreq branch to endloop
li $v0,4
la $a0,msg2
syscall
bgt $t1,19,a40   #if size > 19 branch to a40
li $v0,12        #take character from user
syscall
la $t2,list1     #save list1 address in $t2
addu $t3,$t2,$t0 #t3 adress of list1 + i
sb $v0,0($t3)   #save the character in index i
check1:
li $v0,4
la $a0,msg3
syscall
li $v0,5      #get integer from user
syscall
bgt $v0,4,out1 #if the inserted integer >4 branch to out1
la $t4,poriority #save poriority address in $t4
sll $t3,$t0,2    # multiply i with 2^2 and put it in $t3 (to move in integer array)
addu $t3,$t3,$t4 #add poriority address to i*4 to get the index of i
sw $v0,0($t3)   #save the input integer in poriority[i]
j endif       #jump to endf
out1:  #if entered wrong proiority repeat
li $v0,4
la $a0,msg4
syscall
j check1
a40:
bgt $t2,39,a60 #if size > 39 branch to a60
li $v0,12      #take character from user
syscall
la $t2,list2   #save list2 address in $t2
addi $t5,$t0,-20  
addu $t3,$t2,$t5  #t3 adress of list2 + i-20
sb $v0,0($t3)     #save the character in index i-20
check2:
li $v0,4
la $a0,msg3
syscall
li $v0,5    #get integer from user
syscall
bgt $v0,4,out2  #if the inserted integer >4 branch to out2
la $t4,poriority  #save poriority address in $t4
sll $t3,$t0,2  # multiply i with 2^2 and put it in $t3 (to move in integer array)
addu $t3,$t3,$t4  #add poriority address to i*4 to get the index of i
sw $v0,0($t3)   #save the input integer in poriority[i]
j endif
out2:        #if entered wrong proiority repeat
li $v0,4
la $a0,msg4
syscall
j check2
a60:
bgt $t2,59,a80 #if size > 59 branch to a80
li $v0,12     #take character from user
syscall
la $t2,list3  #save list3 address in $t2
addi $t5,$t0,-40
addu $t3,$t2,$t5  #t3 adress of list2 + i-40
sb $v0,0($t3)     #save the character in index i-40
check3:
li $v0,4
la $a0,msg3
syscall
li $v0,5  #get integer from user
syscall
bgt $v0,4,out3  #if the inserted integer >4 branch to out3
la $t4,poriority  #save poriority address in $t4
sll $t3,$t0,2  # multiply i with 2^2 and put it in $t3 (to move in integer array)
addu $t3,$t3,$t4  #add poriority address to i*4 to get the index of i
sw $v0,0($t3)   #save the input integer in poriority[i]
j endif
out3: #if entered wrong proiority repeat
li $v0,4
la $a0,msg4
syscall
j check3
a80:
li $v0,12  #take character from user
syscall
la $t2,list4  #save list4 address in $t2
addi $t5,$t0,-60
addu $t3,$t2,$t5  #t3 adress of list2 + i-60
sb $v0,0($t3)     #save the character in index i-60
check4:
li $v0,4
la $a0,msg3
syscall 
li $v0,5   #get integer from user
syscall
bgt $v0,4,out4  #if the inserted integer >4 branch to out4
la $t4,poriority   #save poriority address in $t4
sll $t3,$t0,2   # multiply i with 2^2 and put it in $t3 (to move in integer array)
addu $t3,$t3,$t4  #add poriority address to i*4 to get the index of i
sw $v0,0($t3)   #save the input integer in poriority[i]
j endif
out4:   #if entered wrong proiority repeat
li $v0,4
la $a0,msg4
syscall
j check4
endif :  #end of if
addi $t0,$t0,1 #i=i+1
addi $t1,$t1,1 #size=size+1
j loop #jump to the beginning of the loop
endloop :
###################print choices for the user to choose from####################
li $v0,4
la $a0,msg5
syscall
li $v0,4
la $a0,msg6
syscall
li $v0,4
la $a0,msg7
syscall
li $v0,4
la $a0,msg8
syscall
li $v0,4
la $a0,msg9
syscall
li $v0,4
la $a0,msg10
syscall
li $v0,4
la $a0,msg11
syscall
################################################################################ 
startif:
li $v0,4
la $a0,msg12
syscall
li $v0,5
syscall
addu $s1,$0,$v0 #save the entered integer in chooice($s1)
li $s2,1 #compared with choice
beq $s1,$s2,L1 #if choice ==1 go to L1
addi $s2,$s2,1 #$s2=$s2+1
beq $s1,$s2,L2 #if choice ==2 go to L2
addi $s2,$s2,1 #$s2=$s2+1
beq $s1,$s2,L3 #if choice ==3 go to L3
addi $s2,$s2,1 #$s2=$s2+1
beq $s1,$s2,L4 #if choice ==4 go to L4
addi $s2,$s2,1 #$s2=$s2+1
beq $s1,$s2,L5 #if choice ==5 go to L5
addi $s2,$s2,1 #$s2=$s2+1
beq $s1,$s2,L6 #if choice ==6 go to L6
li $v0,4
la $a0,msg19
syscall
j startif #if wrong choice jump to startif
L1:
li $v0,4
la $a0,msg13
syscall

#result = searchrequest , $s3 is available for result

#---------- call search request function ----------#
li $v0,12
syscall
move $a0,$v0  # 1nd parameter to SearchRequest function
la $a1, list1 # 2nd parameter to SearchRequest function
la $a2, list2 # 3rd parameter to SearchRequest function
la $a3, list3 # 4th parameter to SearchRequest function
la $s7, list4 # 5th parameter to SearchRequest function
la $s6, location
jal SearchRequest
move $s3 ,$v0 # this is value return from searchRequest
beq $s3,-1,endf
li $v0,4
la $a0,msg14
syscall
li $v0,1
la $a0,($s3)
syscall
j endf
L2:
li $v0,4
la $a0,msg15
syscall
li $v0,12
syscall
move $t9,$v0 
#---------- call search poririty function ------------#
jal SearchPriority
j endf
L3:
	li $v0,4
	la $a0,msg13
	syscall
	li $v0,12
	syscall
	move $t9,$v0
	li $v0,4
	la $a0,msg16
	syscall
	li $v0,1
	syscall
#$v0 is prior
move $t4 ,$v0
jal SearchRequestAndPoriority
j endf
L4:
#-------------call delete function --------------- #
la $a1 ,poriority    # load address of poriority array in $a1
jal delete_request 

j endf
L5:
li $v0,4
la $a0,msg17
syscall
li $v0,5
syscall

#-------------call process function -------------#\
move $a2,$v0
la $a1 ,poriority
jal process_Request
j endf
L6:
li $v0,4
la $a0,msg18
syscall 
#-------------call empty function --------------#
jal emptyAll
endf:
li $v0,4
la $a0,msg20
syscall
li $v0,5
syscall
bne $v0,1,endwhile
j endloop
endwhile:
li $v0,10
syscall







#--------------------delete function ---------------- ##
## ????? ????? ???? ???? 20180557                      #
#######################################################
# delete function by poriority #
delete_request :
# $t0 --> port 
# $t1 --> i

.data 
delete_msg :.asciiz "Enter priority to delete all request : "
name_Req_msg :.asciiz "\n the request name ->  "
location_Req_msg1:.asciiz " has deleted in list[1] in location : "
location_Req_msg2:.asciiz " has deleted in list[2] in location : "
location_Req_msg3:.asciiz " has deleted in list[3] in location : "
location_Req_msg4:.asciiz " has deleted in list[4] in location : "
.text 
#--------print delete messsage --------#
li $v0 , 4
la $a0 ,delete_msg 
syscall 

#------- take input from user ---------#
li $v0 ,5
syscall 
move $t0 ,$v0  #scanf("%d", &port )

#----------delete from list1-----------# 
li $t1,0   # int i =0
li $t2 ,20 
li $t3 ,'\0'
li $t4 , 0 # the incremeent address of list1
Del_loop_1:

	bge $t1,$t2, done_1    # i < 20
	lw  $s0,($a1)          # poriority [i]
	bne $s0,$t0, done_if   # if ( port == poriority[i] )
	#---- print msg ---#
	li $v0,4
	la $a0 ,name_Req_msg
	syscall
	# here  print name of request 
	li $v0 ,11 
	lb $a0 ,list1($t4)
	syscall 
	sw  $t4,($a1) 	       # poriority[i]=0
	sb  $t3,list1($t4)     # list1[i]='\0'
	
	addi $t5 ,$t1,0 
	# here print the mesage of location request 
	li $v0 ,4
	la $a0 ,location_Req_msg1
	syscall
	# print the value of location 
	li $v0 ,1
	move $a0 , $t5
	syscall
	
	done_if:
	addi $t4 ,$t4 ,1
	addi $a1 ,$a1, 4
	addi $t1,$t1,1
	
	j Del_loop_1
done_1:

#----------delete from list2-----------#
li $t1,0   # int i =0
li $t4,0   # the incremeent address of list2
Del_loop_2:

	bge $t1,$t2, done_2        # i<20
	lw  $s0,($a1)            # poriority[i+20]
	bne $s0,$t0, done_if_2     # if ( port == poriority[i+20] )
	
	#---- print msg ---#
	li $v0,4
	la $a0 ,name_Req_msg
	syscall
	
	# here  print name of request 
	li $v0 ,11 
	lb $a0 ,list2($t4)
	syscall
	sw  $t4,($a1) 	       # poriority[i+20]=0
	sb  $t3,list2($t4)             # list1[i]='\0' # $t3 ---> '\0'
	addi $t5 ,$t1,0 
	
	# here print the mesage of location request 
	li $v0 ,4
	la $a0 ,location_Req_msg2
	syscall
	
	# print the value of location 
	li $v0 ,1
	move $a0 , $t5
	syscall
	
	done_if_2:
	addi $t4 ,$t4 ,1
	addi $a1 ,$a1, 4
	addi $t1,$t1,1
	j Del_loop_2
done_2:
#----------delete from list3-----------# 
li $t1,0   # int i =0
li $t4,0   # the incremeent address of list3
Del_loop_3:

	bge $t1,$t2, done_3 # i<20
	lw  $s0,($a1) # poriority[i+20]
	bne $s0,$t0, done_if_3
	
	#---- print msg ---#
	li $v0,4
	la $a0 ,name_Req_msg
	syscall
	# here  print name of request 
	li $v0 ,11 
	lb $a0 ,list3($t4)
	syscall 
	sw  $t4,($a1)       # poriority[i+40]=0
	sb  $t3,list3($t4)     # list1[i]='\0'
	
	addi $t5 ,$t1,0
	# here print the message of location request 
	li $v0 ,4
	la $a0 ,location_Req_msg3
	syscall
	# print the value of location 
	li $v0 ,1
	move $a0 ,$t5
	syscall 
	
	done_if_3:
	addi $t4 ,$t4 ,1
	addi $a1 ,$a1, 4
	addi $t1,$t1,1
	j Del_loop_3
done_3:
#----------delete from list4-----------# 
li $t1,0   # int i =0
li $t4,0   # the incremeent address of list3

Del_loop_4:

	bge $t1,$t2, done_4 # i<20
	
	lw  $s0,($a1) # poriority[i+20]
	bne $s0,$t0, done_if_4
	
	#---- print msg ---#
	li $v0,4
	la $a0 ,name_Req_msg
	syscall
	
	# here  print name of request 
	li $v0 ,11 
	lb $a0 ,list4($t4)
	syscall 
	sw  $t4,($a1)       # poriority[i+40]=0
	sb  $t3,list4($t4)  # list1[i]='\0'
	
	addi $t5 ,$t1,0
	# here print the message of location request 
	li $v0 ,4
	la $a0 ,location_Req_msg4
	syscall
	# print the value of location 
	li $v0 ,1
	move $a0 ,$t5
	syscall
	
	done_if_4:
	addi $t4 ,$t4 ,1
	addi $a1 ,$a1, 4
	addi $t1,$t1,1
	j Del_loop_4
done_4:

jr $ra 


#-------------- end delete function implementation -------------# 


#--------------------EmptyAll function ---------------##
## mahmoud ramadan ahmed 20180557                      #
######################################################
#------------emptyAll function --------------#
emptyAll:
add  $t0 ,$0,$0 # int i = 0
addi $t1 ,$0,20 # intialize $t1 to end of loop (20)
li $t2 ,'\0'
loopEmpty:
bgt  $t0 ,$t1 ,done    # i<20 
sw $t2 ,list1($t0) #store caracter ('\0')  in list1 that have address $t0  
sw $t2 ,list2($t0) #store caracter ('\0')  in list2 that have address $t0  
sw $t2 ,list3($t0) #store caracter ('\0')  in list3 that have address $t0  
sw $t2 ,list4($t0) #store caracter ('\0')  in list4 that have address $t0  
addi $t0 ,$t0 ,4   # i++ 
j loopEmpty
done:
li $v0 ,4
la $a0 ,msg18
jr $ra 
#---------------end emptyAll implementation ---------------#

#--------------------process request function ---------------##
## mahmoud ramadan ahmed 20180557                            #
#############################################################
process_Request:
# $t0 --> i
# $t1 -->20 
.data 
Req_name_msg1: .asciiz "\n Process Request from list [1] and name :"
Req_name_msg2: .asciiz "\n Process Request from list [2] and name :"
Req_name_msg3: .asciiz "\n Process Request from list [3] and name :"
Req_name_msg4: .asciiz "\n Process Request from list [4] and name :"
.text

#------process loop list 1 -----#

li $t0 ,0 #int i =0 
addi $t1 ,$0 ,20 
li $t3,0
process_loop_1:
bge $t0 ,$t1 ,end_loop_process1 # i<20 
lw  $s0,($a1)                   #add poririty[i] to $s0 
bne $s0 ,$a2,done_if_process1   # if  port == poriority[i]
lb $t4, list1($t3)              # load value from list one in $t4
#--- print mesg request ---#
li $v0 ,4
la $a0 ,Req_name_msg1
syscall 
#--- print the name of request---#
li $v0 ,11
move $a0 ,$t4
syscall
done_if_process1:
addi $t0 ,$t0 ,1 # i++
addi $t3,$t3 , 1 # index of array 
addi $a1,$a1, 4  # index of address
j process_loop_1
end_loop_process1:

#------process loop list 2 -----#
li $t0 ,0 	                #int i =0
addi $t1 ,$0 ,20                # end value of loop
process_loop_2:
bge $t0 ,$t1 ,end_loop_process2 # i<20 
lw  $s0,($a1)                   #add poririty[i] to $s0
bne $s0 ,$a2,done_if_process2   # if  port == poriority[i]
lb $t4, list1($t3)              # load value from list one in $t4
#--- print mesg request ---#
li $v0 ,4
la $a0 ,Req_name_msg2
syscall 
# print the name of request 
li $v0 ,11
move $a0 ,$t4
syscall
done_if_process2:
addi $t0 ,$t0 ,1    # i++
addi $t3,$t3 , 1    # index of array 
addi $a1,$a1, 4     # index of address
j process_loop_2
end_loop_process2:
#------process loop list 3 -----#
li $t0 ,0	                 #int i =0
addi $t1 ,$0 ,20                 # end value of loop
process_loop_3:
bge $t0 ,$t1 ,end_loop_process3  # i<20 
lw  $s0,($a1)                    #add poririty[i] to $s0
bne $s0 ,$a2,done_if_process3    # if  port == poriority[i]
lb $t4, list3($t3)               # load value from list one in $t4
# print the message print_request
li $v0 ,4
la $a0 ,Req_name_msg3
syscall 
# print the name of request 
li $v0 ,11
move $a0 ,$t4
syscall
done_if_process3:
addi $t0 ,$t0 ,1 # i++
addi $t3,$t3 , 1 # index of array 
addi $a1,$a1, 4  # index of address
j process_loop_3
end_loop_process3:

#------process loop list 4 -----#

li $t0 ,0	                #int i =0
addi $t1 ,$0 ,20 
process_loop_4:
bge $t0 ,$t1 ,end_loop_process4 # i<20 
lw  $s0,($a1)			#add poririty[i] to $s0
bne $s0 ,$a2,done_if_process4   # if  port == poriority[i]
lb $t4, list4($t3)		# load value from list one in $t4
# print the message print_request
li $v0 ,4
la $a0 ,Req_name_msg4
syscall 
# print the name of request 
li $v0 ,11
move $a0 ,$t4
syscall
done_if_process4:
addi $t0 ,$t0 ,1 # i++
addi $t3,$t3 , 1 # index of array 
addi $a1,$a1, 4  # index of address
j process_loop_4
end_loop_process4:

jr $ra 

#------------ end implementation of process request with poriority -----------#
#--------------------searchRequest function ----------------#
.data
	msg: .asciiz "\nthe request not found ! \n"
	requestMsg: .asciiz "\nEnter name of Request \n"	
.text
SearchRequest:
    	addi $sp, $sp, -4
        sw $ra, 0($sp)
        
        # save parameters into other registers
        add $s0, $0, $a0
        add $s1, $0, $a1 # list1
        add $s2, $0, $a2 # list2
        add $s3, $0, $a3 # list3
        add $s4, $0, $s7 # list4
        
        # call quicksort for list 1
        add $a0, $0, $a1
        li $a1, 0
        li $a2, 20
        jal quicksort
        
        # call binarySearch for list 1
        add $a0, $0, $s1
        add $a1, $0, $s0
        li $a2, 20
        jal binarySearch
        
        # if result != -1 then return location[result]
        li $t7, -1
        beq $v0, $t7, Loop1
        mul $v0, $v0, 4
        addu $t1, $v0, $s6
        lw $v0, ($t1)
        j exit
        
        # else if result == -1
        Loop1:
        bgt $t0,19,callQuickSort2
    	sll $t5, $t0, 2
    	add $t5, $t5, $s6
    	sw $t0, 0($t5)
    	addi $t0,$t0,1
    	j Loop1
    	
    	# call quicksort for list 2
    	callQuickSort2:
    	add $a0, $0, $s2
        li $a1, 0
        li $a2, 20
        jal quicksort
        
        # call binarySearch for list 2
        add $a0, $0, $s2
        add $a1, $0, $s0
        li $a2, 20
        jal binarySearch
        
        # if result != -1 then return location[result]+20
        li $t7, -1
        beq $v0, $t7, Loop2
        mul $v0, $v0, 4
        addu $t1, $v0, $s6
        lw $v0, ($t1)
        addi $v0, $v0, 20
        j exit
        
        # else if result == -1
        Loop2:
        bgt $t0,19,callQuickSort3
    	sll $t5, $t0, 2
    	add $t5, $t5, $s6
    	sw $t0, 0($t5)
    	addi $t0,$t0,1
    	j Loop2
    	
    	# call quicksort for list 3
    	callQuickSort3:
    	add $a0, $0, $s3
        li $a1, 0
        li $a2, 20
        jal quicksort
        
        # call binarySearch for list 3
        add $a0, $0, $s3
        add $a1, $0, $s0
        li $a2, 20
        jal binarySearch
        
        # if result != -1 then return location[result]+40
        li $t7, -1
        beq $v0, $t7, Loop3
        mul $v0, $v0, 4
        addu $t1, $v0, $s6
        lw $v0, ($t1)
        addi $v0, $v0, 40
        j exit
        
        # else if result == -1
        Loop3:
        bgt $t0,19,callQuickSort4
    	sll $t5, $t0, 2
    	add $t5, $t5, $s6
    	sw $t0, 0($t5)
    	addi $t0,$t0,1
    	j Loop3
    	
    	# call quicksort for list 4
    	callQuickSort4:
    	add $a0, $0, $s4
        li $a1, 0
        li $a2, 20
        jal quicksort
        
        # call binarySearch for list 4
        add $a0, $0, $s4
        add $a1, $0, $s0
        li $a2, 20
        jal binarySearch
        
        # if result != -1 then return location[result]+60
        li $t7, -1
        beq $v0, $t7, printMsg
        mul $v0, $v0, 4
        addu $t1, $v0, $s6
        lw $v0, ($t1)
        addi $v0, $v0, 60
        j exit
        
        # else if result == -1
        printMsg:
        li $v0, 4
        la $a0, msg
        syscall
        
        exit:
	lw $ra, 0,($sp)
        addi $sp, $sp, 4
        
    	jr $ra
    	
    
    

#--------- end searchRequest implementation -------------#



#------------ quick sort function ----------------#

quicksort: 	
 addi $sp, $sp, -4
 sw $ra, 0($sp)
 
slt $t1, $a1, $a2 	# t1=1 --> left < right, otherwise 0
beq $t1, $zero, last	# if left > right, branch to Exit 
jal partition		# call  if left < right

# first recursive call
addi $t2,$v0,0  # j=partition()
move $t4,$a1 	# save left
move $t5,$a2 	# save right
addi $a2,$t2,-1
jal quicksort

# second recursive call
addi $a1,$t2,1
add $a2, $0, $t5
jal quicksort
  
  
last: 
  lw $ra, 0,($sp)
  addi $sp, $sp, 4
        
  jr $ra
  
partition:

addi $t0,$0,0 # pivot
addi $t1,$0,0 # i
addi $t2,$0,0 # j
addi $t3,$0,0 # t

addi $t6,$0,0  # templocation
#la $s3,array

add $t4,$0,$a1

add $t4, $t4, $a0   # t4 = address of( arr )+ $t4
lb $t0, 0($t4)      #  pivot = array[left]

add $t1, $0, $a1 #   i = left
  
addi $t2,$a2,1 # j = right + 1;

firstWhile:#        do i++; while (a[i] <= pivot && i <= right);
addi $t1,$t1,1

add $t5, $t1, $a0   # t5 = address of( arr )+ $t1
lb $s5, 0($t5)      #  s5 = array[i]

slt $t7,$s5,$t0
bne $t7, $0, fWhilefCond
beq $s5, $t0, fWhilefCond
j secondWhile

fWhilefCond:
addi $t4, $0, 1

slt $t8 ,$t1,$a2
bne $t7, $0, fWhilesCond
beq $t1, $a2, fWhilesCond
j secondWhile

fWhilesCond:
addi $t5, $0, 1

checkWhile:
and $t9 ,$t4,$t5
addi $s5,$0,1
beq $t9,$s5,firstWhile

secondWhile:#      do j--; while (a[j] > pivot);

addi $t7,$0,0
addi $t2,$t2,-1

add $t5, $t2, $a0   # t5 = address of( arr )+ $t1
lb $s5, 0($t5)      #  s1 = array[i]

slt $t7,$t0,$s5
bne $t7,$0,secondWhile


cond:#        if (i >= j) break;
addi $t7,$0,0
slt $t7,$t2,$t1 
bne $t7, $0, afterWhile
beq $t1, $t2, afterWhile

add $t5, $t1, $a0   # t5 = address of( arr )+ $t1
lb $t3, 0($t5)      #  s1 = array[i]

add $t8, $t2, $a0   # t8 = address of( arr )+ $t2
lb $t7, 0($t8)      #  t7 = array[j]

#arr[i]=$t7
sb $t7,0($t5)

#array[j] = t
sb $t3,0($t8)

# $t6 = location[i]
la $s6, location
mul $t5, $t1, 4
addu $t8, $t5, $s6   # t8 = address of( location )+ $t5
lw $t6, ($t8)       #  t6 = location[i]

# location[i]=location[j]
mul $t5, $t2, 4
addu $t9, $t5, $s6   # t9 = address of( location )+ $t5
lw $s5, ($t9)       #  s2 = location[j]

sw $s5,0($t8)

# location[j]=temp_location
sw $t6, 0($t9)

continue: # while(1) loop
j firstWhile


afterWhile:

add $t4,$0,$a1
add $t4, $t4, $a0   # t4 = address of( arr )+ $t4
lb $t3, 0($t4)      #  t3 = array[left]

add $t5, $t2, $a0   # t5 = address of( arr )+ $t2
lb $s5, 0($t5)      #  s4 = array[j]
 
#add $a0,$a0,$a0
sw $s5,0($t4)      # a[left] = a[j];

#  a[j] = t;
sb $t3,0($t5)

# $t6 = location[left]
la $s6, location
mul $t5, $a1, 4
addu $t8, $t5, $s6   # t8 = address of( location )+ $t5
lw $t6, ($t8)       #  t6 = location[left]

# location[left]=location[j]
mul $t5, $t2, 4
addu $t9, $t5, $s6   # t9 = address of( location )+ $t5
lw $s5, ($t9)       #  s2 = location[j]

sw $s5,0($t8)

# location[j]=temp_location
sw $t6, 0($t9)


exitPartition:
move $v0 ,$t2  #  return j
jr $ra



#----------- end quick sort implementation ---------------#


#---------- binary search function -------------------#

binarySearch :
    addi $sp, $sp, -4
    sw   $s0, 0($sp)
    addi $sp, $sp, -4
    sw   $s1, 0($sp)
    addi $sp, $sp, -4
    sw   $s2, 0($sp)
    addi $sp, $sp, -4
    sw   $s3, 0($sp)
    
    addi $s0, $0, 0
    subi $s1, $a2, 1
binarySearchLoop: bgt $s0, $s1,E1     #while loop
    sub $t0, $s1, $s0
    srl $t0, $t0, 1
    add $s2, $s0, $t0
    sll $t1, $s2, 2
    add $t2, $t1, $a0
    	#$t4 # -->z
	#$t2 # -->m
	#$a1 --->array have address
	#add $a0 ,$a0 ,$t2 # arr[m]
    lb $t4 ,($t2) #z=arr[m]

    bne $a1, $t4, R1
    add $s3, $0, $0
R1: bne $s3, $zero,R2
    move $v0, $s2
    j Exit
R2: bgt $t4, $a1, F1
    addi $s0,$s2,1
    j binarySearchLoop
F1: subi $s1, $s2, 1
    j binarySearchLoop        #go to loop
E1: addi $t5,$zero, -1
    move $v0, $t5
Exit:
    lw $s0, 0($sp)
    addi $sp,$sp, 4
    lw $s1, 0($sp)
    addi $sp,$sp, 4
    lw $s2, 0($sp)
    addi $sp,$sp, 4
    lw $s3, 0($sp)
    addi $sp,$sp, 4
    jr  $ra
#------------------ end binary search implementation -------------------#


# -------------- Search request by poriority --------------------------#
.data
eprint: .asciiz "not found priority for request !"
ifprint: .asciiz "the priority of request is :"
.text

SearchPriority:
	addi $sp, $sp, -4
	sw $s0, 0($sp)
	jal SearchRequest
	move $s0, $v0		#$s0 = result = SearchRequest(request,list1,list2,list3,list4)
	sll $t0, $s0,2		#
	add $t1, $t0, $a1	#
	lw $t2, 0($t1)		# $t2 = poriority[result]
	addi $t3, $zero, 1
	addi $t4, $zero, 2
	addi $t5, $zero, 3
	addi $t6, $zero, 4

	beq $s0,$t3,True
	beq $s0,$t4,True
	beq $s0,$t5,True
	beq $s0,$t6,True
	j Else
True:
	li $v0,4
	la $a0,ifprint
	syscall
	li $v0,1
	la $a0, ($s0)
	syscall
	j Exit		
Else:
	li $v0,4
	la $a0,eprint
	syscall
Exitend:
	jr $ra

#-------------end searchPorirityAndPorirotiy implementation -------------- #
SearchRequestAndPoriority:
.data
M_Sg1:.asciiz "\n the location of request : "
M_Sg2:.asciiz "\n not found !"
# $v0 ----> result 
move $a0,$t9
la $a1, list1 # 2nd parameter to SearchRequest function
la $a2, list2 # 3rd parameter to SearchRequest function
la $a3, list3 # 4th parameter to SearchRequest function
la $s7, list4 # 5th parameter to SearchRequest function
jal SearchRequest
la $a1 ,poriority
addi $t0 ,$0 ,4
mul $v0 ,$v0 ,$t0  # multiplication index by 4 
add $a1 ,$a1 ,$v0  # increment tha address to the location need 
bne  ($a1),$t4 ,elsePoririty
# print the message #
li $v0 ,4
la $a0 ,M_Sg1 
syscall
# print the value #
li $v0 ,1
la $a0 ,$a1
syscall 
jr $ra
elsePoririty:
	li $v0 ,4
	la $a0 ,M_Sg2
	syscall
	
jr $ra
