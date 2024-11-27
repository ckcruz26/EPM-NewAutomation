*** Settings ***
Library        SeleniumLibrary
Resource    ../../resources/EPM_Resource.robot
    
*** Test Cases ***
[EPM_LOGIN_001] 
    [Tags]     EPM_LOGIN_001
    TRY
        Open WebApp using Chrome
        InputValue    ${personnelUN}    ${personnelPW}
        Click Login Button
        Sleep     2
    EXCEPT    Error
        Fatal Error
    FINALLY
        Close Browser
    END

[EPM_LOGIN_002]
    [Tags]    EPM_LOGIN_002
    TRY
        Open WebApp using Chrome
        InputValue    12456   ASDASDADS
        Click Login Button
        Sleep     2
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicMessage"]
        ${error_msg}     Get Text   xpath=//*[@id="modalDynamicMessage"]
        Should Be Equal  ${error_msg}    Oops! Invalid Credentials. Please contact Personnel Section for further assistance in verifying your information.
    EXCEPT    Error
        Fatal Error
    FINALLY
        Close Browser
    END

[EPM_LOGIN_003]
    [Tags]   EPM_LOGIN_003
    TRY
        Open WebApp using Chrome
        InputValue    6666    ${personnelPW}
        Click Login Button
        Sleep      2
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicMessage"]
        ${error_msg}     Get Text   xpath=//*[@id="modalDynamicMessage"]
        Should Be Equal  ${error_msg}    Oops! Invalid Credentials. Please contact Personnel Section.
    EXCEPT    Error
        Fatal Error
    FINALLY
        Close Browser
    END

[EPM_LOGIN_004]
    [Tags]   EPM_LOGIN_004
    TRY
        Open WebApp using Chrome
        InputValue      ${personnelUN},     ${EMPTY}
        Click Login Button
        Sleep    2
    EXCEPT    Error
        Fatal Error
    FINALLY
        Close Browser
    END

[EPM_LOGIN_005]
    [Tags]  EPM_LOGIN_005
    TRY
        Open WebApp using Chrome
        InputValue       ${EMPTY},       ${personnelPW}
        Click Login Button
        Sleep    2
    EXCEPT    Error
        Fatal Error
    FINALLY
        Close Browser
    END

[EPM_LOGIN_006]
    [Tags]     EPM_LOGIN_006
    TRY
        Open WebApp using Chrome
        Click Link    xpath=/html/body/div[2]/div/div/section/div/div[2]/div/div[1]/label/a
        Sleep     2
    EXCEPT    Error
        Fatal Error
    FINALLY
        Close Browser
    END

[EPM_LOGIN_007]
    [Tags]     EPM_LOGIN_007
    TRY
        Open WebApp using Chrome
        Click Link    xpath=/html/body/div[2]/div/div/section/div/div[2]/div/div[2]/label/a
        Sleep     2
    EXCEPT    Error
        Fatal Error
    FINALLY
        Close Browser
    END

[EPM_LOGIN_008]
    [Tags]     EPM_LOGIN_008
    TRY
        Open WebApp using Chrome
        Click Link    xpath=/html/body/div[2]/div/div/section/div/div[2]/div/div[3]/label/a
        Sleep     2
    EXCEPT    Error
        Fatal Error
    FINALLY
        Close Browser
    END

[EPM_LOGIN_009]
    [Tags]   EPM_LOGIN_009

    Open WebApp using Chrome
    FOR    ${i}    IN RANGE    3
        Log    Attempt ${i + 1} of 3
        InputValue    ${personnelUN}    123131
        Click Login Button
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicMessage"]
        ${error_msg}     Get Text   xpath=//*[@id="modalDynamicMessage"]

        IF  ${i} != 2
            Should Be Equal    ${error_msg}    Oops! Invalid Credentials. Please contact Personnel Section for further assistance in verifying your information.
        END

        Click Button    xpath=//*[@id="modalDynamicButton"]
        Sleep    2

        IF  ${i} == 3
            Wait Until Element Is Visible    xpath=//*[@id="modalDynamicMessage"]
            ${error_msg}    Get Text    xpath=//*[@id="modalDynamicMessage"]
            Should Be Equal    ${error_msg}    Oops! Your account has been locked due to multiple incorrect attempts!    
            Close Browser
        END 
    END
[EPM_LOGIN_010]
    [Tags]   EPM_LOGIN_010
    TRY
        Open WebApp using Chrome
        #DUMMY ACCOUNT -  1
        InputValue    9865    P@ssw0rd
        Click Login Button
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicMessage"]
        ${error_msg}     Get Text   xpath=//*[@id="modalDynamicMessage"]
        Should Be Equal    ${error_msg}    Your account is pending approval. Please contact the Personnel Section.
        Sleep    2
    EXCEPT    Error
        Fatal Error
    FINALLY
        Close Browser
    END
[EPM_LOGIN_011]
    [Tags]   EPM_LOGIN_011
    TRY
        Open WebApp using Chrome
        #DUMMY ACCOUNT -  2
        InputValue    9846    P@ssw0rd
        Click Login Button
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicMessage"]
        ${error_msg}     Get Text   xpath=//*[@id="modalDynamicMessage"]
        Should Be Equal    ${error_msg}    Your registration has been disapproved by the administrator. Please contact the Personnel Section.
        Sleep    2
    EXCEPT    Error
        Fatal Error
    FINALLY
        Close Browser
    END

*** Keywords ***
Click Login Button
    Click Button    xpath=/html/body/div[2]/div/div/section/div/div[2]/form/div[4]/div/button
