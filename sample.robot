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
  ${result}=  Run Process  nmap  -p  22  ${HOST}
  Should Contain  ${result.stdout}  open
  
  
List Content Using Current Working Directory
    ${listing} =  List Directory  .
    Should Contain  ${listing}  ${REMOTE HOME TEST}

MLG Status Check
    [Documentation]  Check MLAG Health
	${output}=  Execute Command  net  show  clag
	Should Contain  ${output} The peer is alive
	
Spanning Tree Status Check
    [Documentation]    Check STP Health
	${output}=    Execute Command  net  show bridge  spanning-tree  json
    Should Contain  ${output}  "rootpotName":"peerlink"

BGP Health Check
    [Documentation]    Check BGP State
	${output}=    Execute Command   net show bgp neighbour
	Should Contain    ${output}    BGP  sate = Established
	
	
