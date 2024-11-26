*** Settings ***
Library        SeleniumLibrary


*** Variables ***
${baseURL}            https://172.31.32.64/registration_pilot/forgot/forgot_password.php
${browserName}        Chrome

*** Test Cases ***

[EPM_FORGOT_PW_001]
    [Tags]     EPM_FORGOT_PW_001
    TRY
        Open WebApp using Chrome
        InputValue     12456    cruzchristiankeirre7675@gmail.com      
        Click Submit Button
        Wait Until Element Is Visible    xpath=//*[@id="modalNotif"]/div/div
        ${success_text}=    Get Text     xpath=//*[@id="modalNotif-message"]
        Should Be Equal    ${success_text}    You will receive an email regarding your request within the next 24 hours. Please check your inbox and spam folder for further instructions.
        Click Button    xpath=//*[@id="modalNotif"]/div/div/div[3]/button
        Sleep     5
    EXCEPT    Error
        Fatal Error
    FINALLY
        Close Browser
    END

[EPM_FORGOT_PW_002]
    [Tags]     EPM_FORGOT_PW_002
    TRY
        Open WebApp using Chrome
        InputValue     ${EMPTY}    cruzchristiankeirre7675@gmail.com      
        Click Submit Button
        Sleep     5
    EXCEPT    Error
        Fatal Error
    FINALLY
        Close Browser
    END

[EPM_FORGOT_PW_003]
    [Tags]    EPM_FORGOT_PW_003
    TRY
        Open WebApp using Chrome
        InputValue     12456        ${EMPTY}    
        Click Submit Button
        Sleep     5
    EXCEPT    Error
        Fatal Error
    FINALLY
        Close Browser
    END

[EPM_FORGOT_PW_005]
    [Tags]    EPM_FORGOT_PW_005
    TRY
        Open WebApp using Chrome
        InputValue     12456        ASDADSADASD@gmail.com     
        Click Submit Button
        Wait Until Element Is Visible    xpath=//*[@id="checkForgotEmail"]
        ${email_error}    Get Text       xpath=//*[@id="checkForgotEmail"]
        Should Be Equal   ${email_error}    Oops! Invalid input detected. Please verify your entry and try again. For assistance, contact support. 
        Sleep     5
    EXCEPT    Error
        Fatal Error
    FINALLY
        Close Browser
    END

[EPM_FORGOT_PW_006]
    [Tags]    EPM_FORGOT_PW_006
    TRY
        Open WebApp using Chrome
        InputValue     99999        cruzchristiankeirre7675@gmail.com      
        Click Submit Button
        Wait Until Element Is Visible    xpath=//*[@id="checkForgotUsername"]
        ${username_error}    Get Text    xpath=//*[@id="checkForgotUsername"]
        Should Be Equal    ${username_error}    Oops! Invalid input detected. Please verify your entry and try again. For assistance, contact support. 
        Sleep     5
    EXCEPT    Error
        Fatal Error
    FINALLY
        Close Browser
    END

[EPM_FORGOT_PW_007]
    [Tags]    EPM_FORGOT_PW_007
    TRY
        Open WebApp using Chrome
        Click Link    xpath=/html/body/div[2]/div[2]/div/div/label/a
    EXCEPT    Error
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
    [Arguments]    ${username}    ${email}
    Input Text    xpath=//*[@id="empno"]     ${username}
    Input Text    xpath=//*[@id="email"]     ${email}

Click Submit Button
    Click Button    xpath=/html/body/div[2]/div[2]/form/div[4]/div/button
