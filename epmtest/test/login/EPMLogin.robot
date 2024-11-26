*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${baseURL}            https://172.31.32.64/registration_pilot/
${browserName}        Chrome
${personnelUN}        12456
${personnelPW}        P@ssw0rd

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
    FOR    ${i}    IN RANGE    3
        Log    Attempt ${i + 1} of 3
        Open WebApp using Chrome
        InputValue    ${personnelUN}    123131
        Click Login Button
        Sleep    2
        IF  ${i} == 3
            Wait Until Element Is Visible    xpath=//*[@id="modalDynamicMessage"]
            ${error_msg}    Get Text    xpath=//*[@id="modalDynamicMessage"]
            Should Be Equal    ${error_msg}    Oops! Your account has been locked due to multiple incorrect attempts!
            Close Browser
        END 
    END

[EPM_LOGIN_010]
    TRY
        Open WebApp using Chrome
        InputValue    12373    ASDQWERTY
        Click Login Button
        Sleep    2
    EXCEPT    Error
        Fatal Error
    FINALLY
        Close Browser
    END

*** Keywords ***

Open WebApp using Chrome
    Open Browser    ${baseURL}    ${browserName}    options=add_argument("--ignore-certificate-errors")
    Maximize Browser Window

InputValue
    [Arguments]    ${username}    ${password}
    Input Text    xpath=/html/body/div[2]/div/div/section/div/div[2]/form/div[1]/div/input[2]    ${username}
    Input Password    xpath=/html/body/div[2]/div/div/section/div/div[2]/form/div[2]/input    ${password}

Click Login Button
    Click Button    xpath=/html/body/div[2]/div/div/section/div/div[2]/form/div[4]/div/button
