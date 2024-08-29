*** Settings ***
Resource    ../resources/luma_library.robot

Suite Setup         Open Luma
Suite Teardown      Close Browser

Test Setup          Go To Home Page

Test Tags           Search

*** Variables ***
${FIRSTNAME}    Test
${LASTNAME}     Lname
${EMAIL}        testemai@mail.net
${PASSWORD}     validpw
${PASSWORD2}    novalidpw
${PRODUCT1}     shoes
${PRODUCT2}     shopes

*** Test Cases ***
Successful Customer Login
    Login To Store    ${EMAIL}  ${PASSWORD}
    Validate Successful Login   ${LASTNAME}

Unsuccessful Customer Login
    Login To Store    ${EMAIL}  ${PASSWORD2}
    Validate Unsuccessful Login

Successfull Products Selection
    [Documentation]  Test case that tests if selecting products to the cart success
    Select Product To Cart
    Choose Options To Item    S
    Add Product To Cart

Successful Search
    [Documentation]  Testcase for testing that searchresults are found
    Search Product    ${PRODUCT1}
    Element Should Contain    ${TOOLBAR_AMOUNT}    Items

Unsuccessful Search
    [Documentation]  Testcase for testing that searchresults are not found
    Search Product    ${PRODUCT2}
    Sleep   3
    Element Should Contain    ${SECTION_SEARCH_RESULTS}    ${MESSAGE_NO_SEARCH_RESULTS}


