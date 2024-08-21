*** Settings ***
Resource    ../resources/luma_library.robot

Suite Setup         Open Luma
Suite Teardown      Close Browser

Test Setup          Go To Home Page

Test Tags           Search

*** Variables ***
${FIRSTNAME}    Test
${LASTNAME}     Lname
${EMAIL}        testuser@email.com
${PASSWORD}     testpw12!"

*** Test Cases ***
#Testing Successfull Products Selection
#    [Documentation]  Test case that tests if selecting products to the cart success
#    Select Product To Cart
#    Choose Options To Item    S
#    Add Product To Cart

#Create An Account
#    [Documentation]  Testcase that tests creating new account
#    Go To New Customer Account Form
#    Input New Customer Info   ${FIRSTNAME}  ${LASTNAME}  ${EMAIL}   ${PASSWORD}
#    Click Button    ${BUTTON_CREATE_ACCOUNT}
#    Page Should Contain    ${TEXT_ACCOUNT_CREATED}

Successfull Customer Login
    Login To Store    ${EMAIL}    ${PASSWORD}     ${LASTNAME}
