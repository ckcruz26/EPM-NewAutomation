*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${baseURL}            https://172.31.32.64/registration_pilot/
${browserName}        Chrome

#Account Levels
${personnelUN}        12456
${sys_personnel_un}    8277
${user_un}            12453

#General User Passwords
${personnelPW}        P@ssw0rd


#Registration Variables
${UploadFiletest}     css=[type='file']
${AddFile}            C:/Users/ckcruz/Downloads/03-12456.png


*** Keywords ***
#General Reuse
Open WebApp using Chrome
    Open Browser    ${baseURL}    ${browserName}    options=add_argument("--ignore-certificate-errors")
    Maximize Browser Window

#Registration Resources
Open WebApp using Chrome Registration
    Open Browser    https://172.31.32.64/registration_pilot/mainRegister.php    ${browserName}    options=add_argument("--ignore-certificate-errors")
    Maximize Browser Window

Input EmpNo to Validate
    [Arguments]    ${username} 
    Input Text    xpath=//*[@id="txtSearch"]    ${username}

Upload File
    Wait Until Page Contains Element   ${UploadFiletest}   4s
    Scroll Element Into View     ${UploadFiletest}
    Choose File     ${UploadFiletest}     ${AddFile}

Click Register Button
    Click Button    xpath=//*[@id="btnSubmit"]


#Login Resources
InputValue
    [Arguments]    ${username}    ${password}
    Input Text    xpath=/html/body/div[2]/div/div/section/div/div[2]/form/div[1]/div/input[2]    ${username}
    Input Password    xpath=/html/body/div[2]/div/div/section/div/div[2]/form/div[2]/input    ${password}