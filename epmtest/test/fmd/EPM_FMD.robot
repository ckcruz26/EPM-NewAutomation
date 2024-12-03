*** Settings ***
Library        SeleniumLibrary
Resource        ../../resources/EPM_Resource.robot

*** Test Cases ***

[EPM_FMD_001]
    [Tags]  EPM_FMD_001
    TRY
        Open WebApp using Chrome
        InputValue    username=${fmd_un}    password=${personnelPW}
        Click Login Button
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicMessage"]    2s
        Click Button          xpath=//*[@id="modalDynamicButton"]
    EXCEPT   Error
        Fatal Error
    FINALLY
        Sleep    2
        Close Browser
    END


[EPM_FMD_002]
    [Tags]  EPM_FMD_002
    TRY
        Open WebApp using Chrome
        InputValue    ${fmd_un}      abcdefg.
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

[EPM_FMD_003]
    [Tags]     EPM_FMD_003
    TRY
        #Login Session First
        Open WebApp using Chrome
        InputValue    username=${fmd_un}    password=${personnelPW}
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

[EPM_FMD_004]
    [Tags]    EPM_FMD_004
    TRY
        #Login Session First
        Open WebApp using Chrome
        InputValue    username=${fmd_un}    password=${personnelPW}
        Click Login Button
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicMessage"]    2s
        Click Button          xpath=//*[@id="modalDynamicButton"]
        Click Profile Menu
        Change EPM Incomplete Input_2   ${EMPTY}     P@ssw0rd    P@ssw0rd1. 
    EXCEPT    Error
        Fatal Error
    FINALLY
        Sleep  2
        Close Browser
    END

[EPM_FMD_005]
    [Tags]    EPM_FMD_005
    TRY
        #Login Session First
        Open WebApp using Chrome
        InputValue    username=${fmd_un}    password=${personnelPW}
        Click Login Button
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicMessage"]    2s
        Click Button          xpath=//*[@id="modalDynamicButton"]
        Click Profile Menu
        Change EPM Incomplete Input_2    P@ssw0rd    ${EMPTY}    P@ssw0rd1. 
    EXCEPT    Error
        Fatal Error
    FINALLY
        Sleep  2
        Close Browser
    END

[EPM_FMD_006]
    [Tags]    EPM_FMD_006
    TRY
        #Login Session First
        Open WebApp using Chrome
        InputValue    username=${fmd_un}    password=${personnelPW}
        Click Login Button
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicMessage"]    2s
        Click Button          xpath=//*[@id="modalDynamicButton"]
        Click Profile Menu
        Change EPM Incomplete Input_2    P@ssw0rd    P@ssw0rd1.    ${EMPTY}
    EXCEPT    Error
        Fatal Error
    FINALLY
        Sleep  2
        Close Browser
    END

[EPM_FMD_007]
    [Tags]    EPM_FMD_007
    TRY
        #Login Session First
        Open WebApp using Chrome
        InputValue    username=${fmd_un}    password=${personnelPW}
        Click Login Button
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicMessage"]    2s
        Click Button          xpath=//*[@id="modalDynamicButton"]
        Click Profile Menu
        Change EPM Incomplete Input_2    ${EMPTY}    ${EMPTY}    ${EMPTY}
    EXCEPT    Error
        Fatal Error
    FINALLY
        Sleep  2
        Close Browser
    END

[EPM_FMD_008]
    [Tags]    EPM_FMD_008
    TRY
        #Login Session First
        Open WebApp using Chrome
        InputValue    username=${fmd_un}    password=${personnelPW}
        Click Login Button
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicMessage"]    2s
        Click Button          xpath=//*[@id="modalDynamicButton"]
        Click Profile Menu
        Change Password EPM Invalid Formats   P@ssw0rd    Pass1,    Pass1,
    EXCEPT    Error
        Fatal Error
    FINALLY
        Sleep  2
        Close Browser
    END

[EPM_FMD_009]
    [Tags]    EPM_FMD_009
    TRY
        #Login Session First
        Open WebApp using Chrome
        InputValue    username=${fmd_un}    password=${personnelPW}
        Click Login Button
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicMessage"]    2s
        Click Button          xpath=//*[@id="modalDynamicButton"]
        Click Profile Menu
    EXCEPT    Error
        Fatal Error
    FINALLY
        Sleep  2
        Close Browser
    END


*** Keywords ***
Click Login Button
    Click Button    xpath=/html/body/div[2]/div/div/section/div/div[2]/form/div[4]/div/button

Click Profile Menu
    Click Element    xpath=//*[@id="profilePage"]
    

Change Password EPM
    [Arguments]    ${old_password}    ${new_password}  ${confirm_password}
    Click Button    xpath=/html/body/div/div/section/div/div[1]/div/div/div/button
    Wait Until Element Is Visible    xpath=//*[@id="changePassword"]/div/div
    Input Password    xpath=//*[@id="OldPassword"]   ${old_password}    
    Input Password    xpath=//*[@id="NewPassword"]    ${new_password}
    Input Password    xpath=//*[@id="ConfirmPassword"]   ${confirm_password}
    Click Button       xpath=//*[@id="btnChangePassword"]
    Wait Until Element Is Visible    xpath=//*[@id="modalNotif-message"]
    ${succ_msg_pw}     Get Text   xpath=//*[@id="modalNotif-message"]
    Should Be Equal    ${succ_msg_pw}    Password Changed!
    Click Button       xpath=//*[@id="modalNotif"]/div/div/div[3]/button
    Sleep    2

Change EPM Incomplete Input_1
    [Arguments]    ${new_password}  ${confirm_password}
    Click Button    xpath=/html/body/div/div/section/div/div[1]/div/div/div/button
    Wait Until Element Is Visible    xpath=//*[@id="changePassword"]/div/div
    Input Password    xpath=//*[@id="NewPassword"]    ${new_password}
    Input Password    xpath=//*[@id="ConfirmPassword"]   ${confirm_password}
    Click Button       xpath=//*[@id="btnChangePassword"]

Change EPM Incomplete Input_2
    [Arguments]    ${old_password}  ${new_password}  ${confirm_password}
    Click Button    xpath=/html/body/div/div/section/div/div[1]/div/div/div/button
    Wait Until Element Is Visible    xpath=//*[@id="changePassword"]/div/div
    Input Password    xpath=//*[@id="OldPassword"]   ${old_password}    
    Input Password    xpath=//*[@id="NewPassword"]    ${new_password}
    Input Password    xpath=//*[@id="ConfirmPassword"]   ${confirm_password}
    Click Button       xpath=//*[@id="btnChangePassword"]

Change Password EPM Invalid Formats
    [Arguments]    ${old_password}    ${new_password}  ${confirm_password}
    Click Button    xpath=/html/body/div/div/section/div/div[1]/div/div/div/button
    Wait Until Element Is Visible    xpath=//*[@id="changePassword"]/div/div
    Input Password    xpath=//*[@id="OldPassword"]   ${old_password}    
    Input Password    xpath=//*[@id="NewPassword"]    ${new_password}
    Input Password    xpath=//*[@id="ConfirmPassword"]   ${confirm_password}
    Click Button       xpath=//*[@id="btnChangePassword"]
    Sleep    2
