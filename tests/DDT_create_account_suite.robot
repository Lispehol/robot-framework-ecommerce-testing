*** Settings ***
Library           DataDriver    ../data/new_customer_data.csv
Resource          ../resources/luma_library.robot

Suite Setup       Run Keywords   Open Luma  AND  Go To New Customer Account Form
Suite Teardown    Close Browser
Test Template     Invalid Create New Account Cases

*** Test Cases ***
Creating New Account With Invalid Data

*** Keywords ***
Invalid Create New Account Cases
    [Arguments]    ${firstname}    ${lastname}    ${email}    ${password}    ${confirmpw}  ${message}
    Input New Customer Info    ${firstname}    ${lastname}    ${email}    ${password}   ${confirmpw}
    Click Button    ${BUTTON_CREATE_ACCOUNT}
    Wait Until Page Contains Element    ${MAGE_ERRORS}    timeout=10 s
    Page Should Contain    ${message}