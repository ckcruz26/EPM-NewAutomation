*** Settings ***
Library        SeleniumLibrary
Resource    ../../resources/EPM_Resource.robot

*** Test Cases ***
EPM_REGISTER_001
    [Tags]   EPM_REGISTER_001
    TRY
        Open WebApp using Chrome Registration
        Input EmpNo to Validate    10002
        Click Search Employee
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicConfirmMessage"]
        ${msg}    Get Text    xpath=//*[@id="modalDynamicConfirmMessage"]
        Should Be Equal    ${msg}  Employee Number found. Ready to proceed with registration?
        Click Button    xpath=//*[@id="modalDynamicConfirmButtonYes"]
    EXCEPT  Error
        Fatal Error
    FINALLY
        Sleep    2
        Close Browser
    END

EPM_REGISTER_002
    [Tags]   EPM_REGISTER_002
      TRY
        Open WebApp using Chrome Registration
        Input EmpNo to Validate    10002
        Click Search Employee
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicConfirmMessage"]
        ${msg}    Get Text    xpath=//*[@id="modalDynamicConfirmMessage"]
        Should Be Equal    ${msg}  Employee Number found. Ready to proceed with registration?
        Click Button    xpath=//*[@id="modalDynamicConfirmButtonNo"]
    EXCEPT  Error
        Fatal Error
    FINALLY
        Sleep    2
        Close Browser
    END

EPM_REGISTER_003
    [Tags]   EPM_REGISTER_003
      TRY
        Open WebApp using Chrome Registration
        Input EmpNo to Validate    1000267
        Click Search Employee
        Wait Until Element Is Visible    xpath=//*[@id="CheckIDmessage"]
        ${msg}    Get Text    xpath=//*[@id="CheckIDmessage"]
        Should Be Equal    ${msg}  Opps! Invalid Employee number
    EXCEPT  Error
        Fatal Error
    FINALLY
        Sleep    2
        Close Browser
    END

EPM_REGISTER_004
    [Tags]   EPM_REGISTER_004
    TRY
        Open WebApp using Chrome Registration
        Input EmpNo to Validate    100
        Click Search Employee
        Wait Until Element Is Visible    xpath=//*[@id="CheckIDmessage"]
        ${msg}    Get Text    xpath=//*[@id="CheckIDmessage"]
        Should Be Equal    ${msg}  Opps! Invalid Employee number
    EXCEPT  Error
        Fatal Error
    FINALLY
        Sleep    2
        Close Browser
    END
EPM_REGISTER_005
    [Tags]   EPM_REGISTER_005
    TRY
        Open WebApp using Chrome Registration
        Input EmpNo to Validate    6666
        Click Search Employee
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicMessage"]
        ${msg}    Get Text    xpath=//*[@id="modalDynamicMessage"]
        Should Be Equal    ${msg}  Oops! Invalid Credentials. Please contact Personnel Section.
    EXCEPT  Error
        Fatal Error
    FINALLY
        Sleep    2
        Close Browser
    END

EPM_REGISTER_006
    [Tags]   EPM_REGISTER_006
    TRY
        Open WebApp using Chrome Registration
        Input EmpNo to Validate    12456
        Click Search Employee
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicMessage"]
        ${msg}    Get Text    xpath=//*[@id="modalDynamicMessage"]
        Should Be Equal    ${msg}  This employee number is already registered in our system.
    EXCEPT  Error
        Fatal Error
    FINALLY
        Sleep    2
        Close Browser
    END

# EPM_REGISTER_007
#     [Tags]     EPM_REGISTER_007
#     TRY
#         Open WebApp using Chrome Registration
#         Input EmpNo to Validate    10002
#         Click Search Employee
#         Wait Until Element Is Visible    xpath=//*[@id="modalDynamicConfirmMessage"]
#         ${msg}    Get Text    xpath=//*[@id="modalDynamicConfirmMessage"]
#         Should Be Equal    ${msg}  Employee Number found. Ready to proceed with registration?
#         Click Button    xpath=//*[@id="modalDynamicConfirmButtonYes"]
#         RegFormAllRequired
#     EXCEPT   Error
#         Fatal Error
#     FINALLY
#         Sleep    2
#         Close Browser
#     END

EPM_REGISTER_008
    [Tags]     EPM_REGISTER_008
    TRY
        Open WebApp using Chrome Registration
        Input EmpNo to Validate    10002
        Click Search Employee
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicConfirmMessage"]
        ${msg}    Get Text    xpath=//*[@id="modalDynamicConfirmMessage"]
        Should Be Equal    ${msg}  Employee Number found. Ready to proceed with registration?
        Click Button    xpath=//*[@id="modalDynamicConfirmButtonYes"]
        IncompleteFillUp_1
    EXCEPT  Error
        Fatal Error
    FINALLY
        Sleep     2
        Close Browser
    END

EPM_REGISTER_009
    [Tags]     EPM_REGISTER_009
    TRY
        Open WebApp using Chrome Registration
        Input EmpNo to Validate    10002
        Click Search Employee
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicConfirmMessage"]
        ${msg}    Get Text    xpath=//*[@id="modalDynamicConfirmMessage"]
        Should Be Equal    ${msg}  Employee Number found. Ready to proceed with registration?
        Click Button    xpath=//*[@id="modalDynamicConfirmButtonYes"]
        IncompleteFillUp_2
    EXCEPT  Error
        Fatal Error
    FINALLY
        Sleep     2
        Close Browser
    END

EPM_REGISTER_010
    [Tags]     EPM_REGISTER_010
    TRY
        Open WebApp using Chrome Registration
        Input EmpNo to Validate    10002
        Click Search Employee
        Wait Until Element Is Visible    xpath=//*[@id="modalDynamicConfirmMessage"]
        ${msg}    Get Text    xpath=//*[@id="modalDynamicConfirmMessage"]
        Should Be Equal    ${msg}  Employee Number found. Ready to proceed with registration?
        Click Button    xpath=//*[@id="modalDynamicConfirmButtonYes"]
        IncompleteFillUp_3
    EXCEPT  Error
        Fatal Error
    FINALLY
        Sleep     2
        Close Browser
    END


*** Keywords ***

Click Search Employee
    Click Button    xpath=//*[@id="btn_search"]
# RegFormAllRequired
#     Input Password     xpath=//input[@id='DesiredPassword']    P@ssw0rd1.
#     Input Password     xpath=//*[@id="ConfirmPassword"]   P@ssw0rd1.
#     Page Should Contain Element    xpath=//*[@id="AddSex"]  2s
#     Select From List By Value       xpath=//*[@id="AddSex"]    0
#     Input Text      xpath=//*[@id="AddBirthdate"]   23/08/2000
#     Input Text    xpath=//*[@id="AddEmail"]   dummyzxc@gmail.com
#     Input Text     xpath=//*[@id="AddMobileNumber"]    09281005999
#     Input Text     xpath=//*[@id="AddHouseNumber"]    29
#     Input Text    xpath=//*[@id="AddStreet"]    187
#     Page Should Contain Element    xpath=//*[@id="AddRegion"]       2s
#     Select From List By Label      xpath=//*[@id="AddRegion"]      NCR [National Capital Region]
#     Page Should Contain Element    xpath=//*[@id="AddProvince"]     2s
#     Select From List By Label      xpath=//*[@id="AddProvince"]    NCR FIRST DISTRICT
#     Page Should Contain Element    xpath=//*[@id="AddCity"]       2s
#     Select From List By Label      xpath=//*[@id="AddCity"]       BINONDO
#     Page Should Contain Element    xpath=//*[@id="AddBarangay"]      2s
#     Select From List By Label      xpath=//*[@id="AddBarangay"]   BARANGAY 287
#     Upload File
#     Click Element    xpath=//*[@id="dataConsent"]
#     Click Register Button

IncompleteFillUp_1
    Input Password     xpath=//input[@id='DesiredPassword']    ${EMPTY}
    Input Password     xpath=//*[@id="ConfirmPassword"]   ${EMPTY}
    Page Should Contain Element    xpath=//*[@id="AddSex"]  2s
    Select From List By Value       xpath=//*[@id="AddSex"]    0
    Input Text      xpath=//*[@id="AddBirthdate"]   23/08/2000
    Input Text    xpath=//*[@id="AddEmail"]   ${EMPTY}
    Input Text     xpath=//*[@id="AddMobileNumber"]    ${EMPTY}
    Input Text     xpath=//*[@id="AddHouseNumber"]    ${EMPTY}
    Input Text    xpath=//*[@id="AddStreet"]    ${EMPTY}
    Page Should Contain Element    xpath=//*[@id="AddRegion"]       2s
    Select From List By Label      xpath=//*[@id="AddRegion"]      NCR [National Capital Region]
    Page Should Contain Element    xpath=//*[@id="AddProvince"]     2s
    Select From List By Label      xpath=//*[@id="AddProvince"]    NCR FIRST DISTRICT
    Page Should Contain Element    xpath=//*[@id="AddCity"]       2s
    Select From List By Label      xpath=//*[@id="AddCity"]       BINONDO
    Page Should Contain Element    xpath=//*[@id="AddBarangay"]      2s
    Select From List By Label      xpath=//*[@id="AddBarangay"]   BARANGAY 287
    Click Element    xpath=//*[@id="dataConsent"]
    Click Register Button

IncompleteFillUp_2
    Input Password     xpath=//input[@id='DesiredPassword']    P@ssw0rd1.
    Input Password     xpath=//*[@id="ConfirmPassword"]   P@ssw0rd1.
    Input Text    xpath=//*[@id="AddEmail"]   dummyzxc@gmail.com
    Input Text     xpath=//*[@id="AddMobileNumber"]    09281005999
    Input Text     xpath=//*[@id="AddHouseNumber"]    29
    Input Text    xpath=//*[@id="AddStreet"]    187
    Upload File
    Click Element    xpath=//*[@id="dataConsent"]
    Click Register Button

IncompleteFillUp_3
    Input Password     xpath=//input[@id='DesiredPassword']    P@ssw0rd1.
    Input Password     xpath=//*[@id="ConfirmPassword"]   P@ssw0rd1.
    Page Should Contain Element    xpath=//*[@id="AddSex"]  2s
    Select From List By Value       xpath=//*[@id="AddSex"]    0
    Input Text      xpath=//*[@id="AddBirthdate"]   23/08/2000
    Input Text    xpath=//*[@id="AddEmail"]   dummyzxc@gmail.com
    Input Text     xpath=//*[@id="AddMobileNumber"]    09281005999
    Input Text     xpath=//*[@id="AddHouseNumber"]    29
    Page Should Contain Element    xpath=//*[@id="AddRegion"]       2s
    Select From List By Label      xpath=//*[@id="AddRegion"]      NCR [National Capital Region]
    Page Should Contain Element    xpath=//*[@id="AddProvince"]     2s
    Select From List By Label      xpath=//*[@id="AddProvince"]    NCR FIRST DISTRICT
    Page Should Contain Element    xpath=//*[@id="AddCity"]       2s
    Select From List By Label      xpath=//*[@id="AddCity"]       BINONDO
    Upload File
    Click Register Button



   
    
   

    

    