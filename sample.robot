*** setting ***
Library	  	SSHLibrary
Library    Process
Suite Setup	    Open Connection And Log In
Suite Teardown 	Close All Connections

*** Variables ***
${HOST}	    54.187.16.255
${USERNAME}    loka
${PASSWORD}    loka
${REMOTE HOME TEST}       hello.txt



*** Keywords ***
Open Connection And Log In
   Open Connection    ${HOST}
   Login 		${USERNAME}  ${PASSWORD}
   
   
*** Test Cases ***
Internet Connectivity Ping Test
	[Documentation]		Ping Test To 8.8.8.8
	${result}=		Execute Command  ping 8.8.8.8 -c 1
	Should Contain 		${result}		64 bytes from 8.8.8.8
	
	
Sever port checking 
  [Documentation]  Checking port on  server
  ${result}=  Run Process  nmap  -Pn  22  ${HOST}
  Should Contain  ${result.stdout}  open
  
  
List Content Using Current Working Directory
    ${listing} =  List Directory  .
    Should Contain  ${listing}  ${REMOTE HOME TEST}


Execute Time Consuming Sudo Command
    ${stdout} =  Execute Command  -k sleep 5; echo hello   sudo=True  sudo_password=loka
    Should Contain  ${stdout}  hello
	
	
