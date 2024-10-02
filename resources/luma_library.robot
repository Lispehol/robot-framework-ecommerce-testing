*** Settings ***
Documentation   Keywords for luma_tests_suite
Library         SeleniumLibrary
Resource        luma_objects.robot

*** Keywords ***
Open Luma
    [Arguments]      ${url}=${DEFAULT_URL}  ${browser}=${DEFAULT_BROWSER}  ${speed}=${DEFAULT_SPEED}
    Open Browser     ${url}  ${browser}  options=add_argument('disable-search-engine-choice-screen')
    Maximize Browser Window
    Set Selenium Speed    ${speed}
    Title Should Be  ${HOMEPAGE_TITLE}

Go To Home Page
    [Documentation]  Keyword for going to homepage when title is not correct
    ...
    ${title} =  Get Title
    Run Keyword If    "${title}" != "${HOMEPAGE_TITLE}"
    ...    Go To    ${DEFAULT_URL}
    Title Should Be    ${HOMEPAGE_TITLE}

Select Product To Cart
    [Documentation]  Keyword for selecting the first available product to the shopping cart
    Wait Until Element Is Visible    ${PRODUCT_GRID}
    ${product_name} =   Get Text    ${LINK_FIRST_PRODUCT_ITEM}
    Click Link    ${LINK_FIRST_PRODUCT_ITEM_PHOTO}
    Element Should Contain         ${PRODUCT_TITLE}     ${product_name}
    RETURN    ${product_name}

Choose Options To Item
    [Documentation]  Keyword for selecting required options when adding the first product
    ...
    [Arguments]  ${option1}
    ${sizes} =   Get WebElements    ${ELEMENTS_SELECT_SIZE}
    ${colors} =  Get WebElements    ${ELEMENTS_SELECT_COLOR}
    ${length} =     Get Length    ${sizes}
    FOR  ${count}   IN RANGE    0   ${length}
        ${value} =  Get Text    ${sizes}[${count}]
        IF  '${value}' == '${option1}'
            Click Element    ${sizes}[${count}]
        END
    END
    Click Element                ${ELEMENTS_FIRST_SELECT_COLOR}

Add Product To Cart
    [Documentation]  Keyword for clicking the add cart button
    ...
    ...              Preconditions: Browser should be on product page
    Element Should Be Enabled    ${BUTTON_PRODUCT_ADD_TO_CART}
    Click Button                 ${BUTTON_PRODUCT_ADD_TO_CART}

Check Cart
    [Documentation]    Keyword for checking that the added item is found on the cart
    [Arguments]    ${item}
    Click Link       ${LINK_SHOPPINGCART}
    Sleep    5
    Element Should Be Visible    ${VIEW_EDIT_CART}
    Click Element    ${VIEW_EDIT_CART}
    Wait Until Element Contains    ${PRODUCT_ITEM_NAME}    ${item}    timeout=15s

Go To New Customer Account Form
    [Documentation]   Keyword for goint to the new customer account form
    Click Link      ${LINK_CREATE_ACCOUNT}
    Wait Until Location Contains    ${URL_CREATE_ACCOUNT}   timeout=15s
    Title Should Be    ${TITLE_CREATE_ACCOUNT_PAGE} 

Input New Customer Info
    [Documentation]  Keyword for filling input fields of new customer form
    [Arguments]  ${fname}   ${lname}  ${email}   ${password}   ${password2}
    Input Text          ${INPUT_FIRSTNAME}       ${fname}
    Input Text          ${INPUT_LASTNAME}        ${lname}
    Input Text          ${INPUT_EMAIL}           ${email}
    Input Password      ${INPUT_PASSWORD}        ${password}
    Input Password      ${INPUT_CONFIRM_PASSWORD}     ${password2}

Create An Account
    [Documentation]  Testcase that tests creating new account
    [Arguments]  ${firstname}  ${lastname}  ${email}  ${password}
    Go To New Customer Account Form
    Input New Customer Info   ${firstname}  ${lastname}  ${email}  ${password}
    Click Button    ${BUTTON_CREATE_ACCOUNT}
    Page Should Contain    ${TEXT_ACCOUNT_CREATED}

Login To Store
    [Documentation]  Keyword for login to the store with email and password
    [Arguments]       ${email}  ${password}     ${timeout}=${DEFAULT_TIMEOUT}
    Click Element     ${LINK_SIGNIN}
    Sleep   3
    Input Text        ${LOGIN_INPUT_EMAIL}      ${email}
    Input Password    ${LOGIN_INPUT_PASS}       ${password}
    Click Button      ${BUTTON_LOGIN}

Validate Successful Login
    [Documentation]  Keyword for validating successful login with user's name
    [Arguments]  ${name}   ${timeout}=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${ELEMENT_CUSTOMER_NAME}   timeout=${timeout}
    Element Should Contain    ${ELEMENT_CUSTOMER_NAME}    ${name}

Validate Unsuccessful Login
    [Documentation]  Keyword for validating unsuccessful login
    Wait Until Element Is Visible    ${LOGIN_MESSAGE}
    Element Should Contain    ${LOGIN_MESSAGE}     ${LOGIN_MESSAGE_TEXT_ERROR}

Search Product
    [Documentation]  Keyword for searching a product via search panel
    ...
    ...              Browser must be on home page
    [Arguments]      ${product}  ${timeout}=${DEFAULT_TIMEOUT}
    Click Element    ${SEARCH_PANEL}
    Input Text       ${SEARCH_PANEL}    ${product}
    Press Keys       ${SEARCH_PANEL}    ENTER
    Wait Until Element Is Visible    ${HEADER_SEARCH_RESULTS}   timeout=${timeout}
    Element Should Contain    ${HEADER_SEARCH_RESULTS}   ${product}

Go To Subscribe Page
    Click Link      ${LINK_SUBSCRIBE}
    Switch Window    NEW
    Wait Until Location Contains    /subscribe/    timeout=15s

Successful Subscribing
    [Arguments]     ${email}
    Input Text      ${SUBSCRIBE_INPUT_EMAIL}    ${email}
    Click Element   ${SUBSCRIBE_SUBMIT}
    Element Should Be Visible    ${SUBSCRIBE_RESPONSE_SUCCESS}

Unsuccessful Subscribing
    [Arguments]     ${email}
    Input Text      ${SUBSCRIBE_INPUT_EMAIL}    ${email}
    Click Element   ${SUBSCRIBE_SUBMIT}
    Element Should Be Visible    ${SUBSCRIBE_EMAIL_ERROR}


    




