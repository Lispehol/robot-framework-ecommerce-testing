*** Settings ***
Documentation       Suite for testing basic functionalities of the website
Resource            ../resources/luma_library.robot

Suite Setup         Open Luma
Suite Teardown      Close Browser

Test Setup          Go To Home Page

*** Variables ***
${FIRSTNAME}    Test
${LASTNAME}     Lname
${EMAIL}        testemai@mail.net
${PASSWORD}     Validpw1
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

Successful Products Selection
    [Documentation]  A test case that tests if selecting products to the cart success
    ${item} =    Select Product To Cart
    Choose Options To Item    S
    Add Product To Cart
    Go To Home Page
    Check Cart    ${item}

Successful Search
    [Documentation]  A test case for testing that searchresults are found
    [Tags]           Search
    Search Product    ${PRODUCT1}
    Element Should Contain    ${TOOLBAR_AMOUNT}    Items

Unsuccessful Search
    [Documentation]  A test case for testing that searchresults are not found
    [Tags]           Search
    Search Product    ${PRODUCT2}
    Sleep   3
    Element Should Contain    ${SECTION_SEARCH_RESULTS}    ${MESSAGE_NO_SEARCH_RESULTS}

Subscribing Successfully
     [Documentation]   A test case that tests the successful subscription of the newsletter
     Go To Subscribe Page
     Successful Subscribing    ${EMAIL}

Subscribing Unsuccessfully
    [Documentation]   A test case that tests an unsuccessful subscription to the newsletter
    Go To Subscribe Page
    Unsuccessful Subscribing    ${EMAIL}


