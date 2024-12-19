*** Settings ***
Library        SeleniumLibrary
Resource        ../../resources/EPM_Resource.robot


*** Variables ***
${xpath}       //select[@name='userManage_length']
@{values}      10   25   50   100
${sys_personnel_un}    8277

@{pos_module_search_val}    SOFTWARE QA ENGINEER    SQA    CHRISTIAN KEIRRE    2024-11-13    SALAZAR    2024-06-14	


*** Test Cases ***

[EPM_PERSONNEL_001]
    [Tags]  EPM_PERSONNEL_001
    TRY
        Open WebApp using Chrome
        InputValue    username=${sys_personnel_un}    password=${personnelPW}
        Click Login Button
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicMessage"]    2s
        Click Button          xpath=//*[@id="modalDynamicButton"]
    EXCEPT   Error
        Fatal Error
    FINALLY
        Sleep    2
        Close Browser
    END
[EPM_PERSONNEL_002]
    [Tags]  EPM_PERSONNEL_002
    TRY
        Open WebApp using Chrome
        InputValue    ${sys_personnel_un}      abcdefg.
        Click Login Button
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicMessage"]
        ${error_msg}     Get Text   xpath=//*[@id="modalDynamicMessage"]
        Should Be Equal  ${error_msg}    Oops! Invalid Credentials. Please contact Personnel Section for further assistance in verifying your information.
        Click Button    xpath=//*[@id="modalDynamicButton"]
    EXCEPT    Error
        Fatal Error
    FINALLY
        Sleep   2
        Close Browser
    END

[EPM_PERSONNEL_003]
    [Tags]     EPM_PERSONNEL_003
    TRY
        #Login Session First
        Open WebApp using Chrome
        InputValue    username=${sys_personnel_un}    password=${personnelPW}
        Click Login Button
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicMessage"]    2s
        Click Button          xpath=//*[@id="modalDynamicButton"]
        Click Profile Menu
        Change Password EPM    P@ssw0rd    P@ssw0rd1.    P@ssw0rd1.
    EXCEPT     Error
        Fatal Error
    FINALLY     
        Sleep    2
        Close Browser
    END    

[EPM_PERSONNEL_004]
    [Tags]  EPM_PERSONNEL_004
    TRY
        #Login Session First
        Open WebApp using Chrome
        InputValue    username=${sys_personnel_un}    password=${personnelPW}
        Click Login Button
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicMessage"]    2s
        Click Button          xpath=//*[@id="modalDynamicButton"]
        Click Profile Menu
        Change EPM Incomplete Input_1     Qwerty123.      Qwerty123.
    EXCEPT   Error
        Fatal Error
    FINALLY
        Sleep    2s
        Close Browser
    END


[EPM_PERSONNEL_116]
    [Tags]  EPM_PERSONNEL_116
    TRY
        Open WebApp using Chrome
        InputValue    username=${sys_personnel_un}    password=${personnelPW}
        Click Login Button
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicMessage"]    2s
        Click Button          xpath=//*[@id="modalDynamicButton"]
        Position Negative Testing_1    27/11/2024
    EXCEPT   Error
        Fatal Error
    FINALLY
        Sleep    2s
        Close Browser
    END

[EPM_PERSONNEL_117]
    [Tags]  EPM_PERSONNEL_117
    TRY
        Open WebApp using Chrome
        InputValue    username=${sys_personnel_un}    password=${personnelPW}
        Click Login Button
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicMessage"]    2s
        Click Button          xpath=//*[@id="modalDynamicButton"]
        Add Position Testing   28/11/2024
    EXCEPT   Error
        Fatal Error
    FINALLY
        Sleep    2s
        Close Browser
    END

[EPM_PERSONNEL_118]
    [Tags]  EPM_PERSONNEL_118
    TRY
        Open WebApp using Chrome
        InputValue    username=${sys_personnel_un}    password=${personnelPW}
        Click Login Button
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicMessage"]    2s
        Click Button          xpath=//*[@id="modalDynamicButton"]
        Filter Positions By Selecting Value
    EXCEPT   Error
        Fatal Error
    FINALLY
        Sleep    2s
        Close Browser
    END

[EPM_PERSONNEL_126]
    [Tags]  EPM_PERSONNEL_126
    TRY
        Open WebApp using Chrome
        InputValue    username=${sys_personnel_un}    password=${personnelPW}
        Click Login Button
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicMessage"]    2s
        Click Button          xpath=//*[@id="modalDynamicButton"]
        Negative Testing Manage Position Name    COMP ENGINEER 6        ${EMPTY}
    EXCEPT   Error
        Fatal Error
    FINALLY
        Sleep    2s
        Close Browser
    END

[EPM_PERSONNEL_127]
    [Tags]  EPM_PERSONNEL_127
    TRY
        Open WebApp using Chrome
        InputValue    username=${sys_personnel_un}    password=${personnelPW}
        Click Login Button
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicMessage"]    2s
        Click Button          xpath=//*[@id="modalDynamicButton"]
        Positive Testing Manage Position Name    COMP ENGINEER V   CP ENG V
    EXCEPT   Error
        Fatal Error
    FINALLY
        Sleep    2s
        Close Browser
    END

[EPM_PERSONNEL_131]
    [Tags]  EPM_PERSONNEL_131
    TRY
        Open WebApp using Chrome
        InputValue    username=${sys_personnel_un}    password=${personnelPW}
        Click Login Button
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicMessage"]    2s
        Click Button          xpath=//*[@id="modalDynamicButton"]
        Search Position in Search Box
    EXCEPT   Error
        Fatal Error
    FINALLY
        Sleep    2s
        Close Browser
    END




*** Keywords ***
Click Login Button
    Click Button    xpath=/html/body/div[2]/div/div/section/div/div[2]/form/div[4]/div/button

Click Profile Menu
    Click Element    xpath=//*[@id="profilePage"]/a

Change Password EPM
    [Arguments]    ${old_password}    ${new_password}  ${confirm_password}
    Click Button    xpath=/html/body/div/div/section/div/div[1]/div/div/div/button
    Wait Until Element Is Visible    xpath=//*[@id="changePassword"]/div/div
    Input Password    xpath=//*[@id="OldPassword"]   ${old_password}    
    Input Password    xpath=//*[@id="NewPassword"]    ${new_password}
    Input Password    xpath=//*[@id="ConfirmPassword"]   ${confirm_password}
    Click Button       xpath=//*[@id="btnSubmit"]

     FOR    ${msgs}    IN    @{messages}
        Log    Processing message: ${msgs}
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicConfirmContent"]
        ${modal_msg}=    Get Text    xpath=//*[@id="modalDynamicConfirmMessage"]
        Sleep    3s
        Log To Console    Modal Message: ${modal_msg}
        Should Be Equal    ${modal_msg}    ${msgs}
        Click Button    xpath=//*[@id="modalDynamicConfirmButtonYes"]
    END

    Sleep    2

Change EPM Incomplete Input_1
    [Arguments]    ${new_password}  ${confirm_password}
    Click Button    xpath=/html/body/div/div/section/div/div[1]/div/div/div/button
    Wait Until Element Is Visible    xpath=//*[@id="changePassword"]/div/div
    Input Password    xpath=//*[@id="NewPassword"]    ${new_password}
    Input Password    xpath=//*[@id="ConfirmPassword"]   ${confirm_password}
    Click Button       xpath=//*[@id="btnChangePassword"]

Position Negative Testing_1
    [Arguments]    ${date_created}
    Click Link    xpath=/html/body/div/header/nav/a
    Click Element    xpath=//*[@id="sysAdmin"]
    Wait Until Element Is Visible    xpath=//*[@id="sysAdmin"]/ul/li[4]
    Click Element    xpath=//*[@id="sysAdmin"]/ul/li[4]
    Click Button   xpath=//*[@id="btnAdd"]
    Wait Until Element Is Visible    xpath=//*[@id="positionContentAdd"]
    Input Text    xpath=//*[@id="addPositionDateCreated"]    ${date_created}
    Click Button    xpath=//*[@id="positionContentAdd"]/div[3]/button[2]

Add Position Testing
    [Arguments]    ${date_created}
    Click Link    xpath=/html/body/div/header/nav/a
    Click Element    xpath=//*[@id="sysAdmin"]
    Wait Until Element Is Visible    xpath=//*[@id="sysAdmin"]/ul/li[4]
    Click Element    xpath=//*[@id="sysAdmin"]/ul/li[4]
    Click Button   xpath=//*[@id="btnAdd"]
    Wait Until Element Is Visible    xpath=//*[@id="positionContentAdd"]

    Page Should Contain Element    xpath=//*[@id="addPositionName"]      2s
    Select From List By Label       xpath=//*[@id="addPositionName"]    COMPUTER PROGRAMMER II

    Page Should Contain Element    xpath=//*[@id="addPositionClassification"]    2s
    Select From List By Label       xpath=//*[@id="addPositionClassification"]   COST OF SERVICE
    
    Page Should Contain Element    xpath=//*[@id="addPositionSalaryGrade"]     2s
    Select From List By Label       xpath=//*[@id="addPositionSalaryGrade"]    18

    Page Should Contain Element    xpath=//*[@id="addPositionFundSource"]    2s
    Select From List By Label       xpath=//*[@id="addPositionFundSource"]    ICTMS

    Input Text    xpath=//*[@id="addPositionDateCreated"]    ${date_created}

    Page Should Contain Element    xpath=//*[@id="addPositionFundSource"]    2s
    Select From List By Label       xpath=//*[@id="addPositionFundSource"]    ICTMS

    Page Should Contain Element    xpath=//*[@id="addPositionDivision"]  2s
    Select From List By Label       xpath=//*[@id="addPositionDivision"]    POLICY AND PLANS DIVISION

    Page Should Contain Element    xpath=//*[@id="addPositionUnit"]   2s
    Select From List By Label      xpath=//*[@id="addPositionUnit"]     NATIONAL HOUSING TARGETING SECTION

    Click Button    xpath=//*[@id="positionContentAdd"]/div[3]/button[2]


Filter Positions By Selecting Value
    Click Link    xpath=/html/body/div/header/nav/a
    Click Element    xpath=//*[@id="sysAdmin"]
    Wait Until Element Is Visible    xpath=//*[@id="sysAdmin"]/ul/li[4]
    Click Element    xpath=//*[@id="sysAdmin"]/ul/li[4]
    
    FOR    ${value}    IN    @{values}
        Log    Selecting value ${value} from the dropdown
        Page Should Contain Element    xpath=${xpath}    2s
        Select From List By Label      xpath=${xpath}    ${value}
        Sleep    3s
    END

Negative Testing Manage Position Name
    [Arguments]    ${pos_name}    ${pos_initial}
    Click Link    xpath=/html/body/div/header/nav/a
    Click Element    xpath=//*[@id="sysAdmin"]
    Wait Until Element Is Visible    xpath=//*[@id="sysAdmin"]/ul/li[5]
    Click Element    xpath=//*[@id="sysAdmin"]/ul/li[5]
    Click Button    xpath=//*[@id="btnAdd"]
    Wait Until Element Is Visible    xpath=//*[@id="addNewPositionName"]/div/div
    Input Text    xpath=//*[@id="addLPNPositionName"]    ${pos_name}
    Input Text    xpath=//*[@id="addLPNPositionInitial"]   ${pos_initial}
    Click Button    xpath=//*[@id="positionNameAdd"]/div[3]/button[2]


Positive Testing Manage Position Name
    [Arguments]    ${pos_name}    ${pos_initial}
    Click Link    xpath=/html/body/div/header/nav/a
    Click Element    xpath=//*[@id="sysAdmin"]
    Wait Until Element Is Visible    xpath=//*[@id="sysAdmin"]/ul/li[5]
    Click Element    xpath=//*[@id="sysAdmin"]/ul/li[5]
    Click Button    xpath=//*[@id="btnAdd"]
    Wait Until Element Is Visible    xpath=//*[@id="addNewPositionName"]/div/div
    Input Text    xpath=//*[@id="addLPNPositionName"]    ${pos_name}
    Input Text    xpath=//*[@id="addLPNPositionInitial"]   ${pos_initial}
    Click Button    xpath=//*[@id="positionNameAdd"]/div[3]/button[2]

Search Position in Search Box
    Click Link    xpath=/html/body/div/header/nav/a
    Click Element    xpath=//*[@id="sysAdmin"]
    Wait Until Element Is Visible    xpath=//*[@id="sysAdmin"]/ul/li[5]
    Click Element    xpath=//*[@id="sysAdmin"]/ul/li[5]
    Wait Until Element Is Visible     xpath=//*[@id="tblManagePosition_filter"]/label/input

    FOR   ${iterate_search}  IN  @{pos_module_search_val}
        Input Text    xpath=//*[@id="tblManagePosition_filter"]/label/input   ${iterate_search}
        Sleep    2s
        Clear Element Text    xpath=//*[@id="tblManagePosition_filter"]/label/input
    END
    