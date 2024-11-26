*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${baseURL}            https://172.31.32.64/registration_pilot/
${browserName}        Chrome
${personnelUN}        12456
${personnelPW}        P@ssw0rd

*** Test Cases ***
[EPM_SUPER_ADMIN_001]
    [Tags]  EPM_SUPER_ADMIN_001
    TRY
        Open WebApp using Chrome
        InputValue    username=${personnelUN}    password=${personnelPW}
        Click Login Button
    EXCEPT   Error
        Fatal Error
    FINALLY
        Sleep    2
        Close Browser
    END
[EPM_SUPER_ADMIN_002]
    [Tags]  EPM_SUPER_ADMIN_002
    TRY
        Open WebApp using Chrome
        InputValue    ${personnelUN}      abcdefg.
        Click Login Button
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicMessage"]
        ${error_msg}     Get Text   xpath=//*[@id="modalDynamicMessage"]
        Should Be Equal  ${error_msg}    Oops! Invalid Credentials. Please contact Personnel Section for further assistance in verifying your information.
    EXCEPT    Error
        Fatal Error
    FINALLY
        Sleep   2
        Close Browser
    END

[EPM_SUPER_ADMIN_003]
    [Tags]     EPM_SUPER_ADMIN_003
    TRY
        #Login Session First
        Open WebApp using Chrome
        InputValue    username=${personnelUN}    password=${personnelPW}
        Click Login Button
        
    EXCEPT     Error
        Fatal Error
    FINALLY     
        Sleep    2
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