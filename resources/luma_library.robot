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
    ${title} =  Get Title
    Run Keyword If    "${title}" != "${HOMEPAGE_TITLE}"
    ...    Go To    ${DEFAULT_URL}
    Title Should Be    ${HOMEPAGE_TITLE}

Select Product To Cart
    Wait Until Element Is Visible    ${PRODUCT_GRID}
    ${product_name} =   Get Text    ${LINK_FIRST_PRODUCTITEM}
    Click Link    ${LINK_FIRST_PRODUCTITEMPHOTO}
    Element Should Contain         ${PRODUCT_TITLE}     ${product_name}

Choose Options To Item
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
    Element Should Be Enabled    ${BUTTON_PRODUCT_ADDTOCART} 
    Click Button                 ${BUTTON_PRODUCT_ADDTOCART}

Go To New Customer Account Form
    Click Link      ${LINK_CREATE_ACCOUNT}
    Wait Until Location Contains    ${URL_CREATE_ACCOUNT}   timeout=15s
    Title Should Be    ${TITLE_CREATE_ACCOUNT_PAGE} 

Input New Customer Info
    [Documentation]  Keyword for filling input fields of new customer form
    [Arguments]  ${fname}   ${lname}  ${email}   ${password}
    Input Text          ${INPUT_FIRSTNAME}       ${fname}
    Input Text          ${INPUT_LASTNAME}        ${lname}
    Input Text          ${INPUT_EMAIL}           ${email}
    Input Password      ${INPUT_PASSWORD}        ${password}
    Input Password      ${INPUT_CONFIRM_PASSWORD}     ${password}

Login To Store
    [Arguments]     ${email}  ${password}  ${name}
    Click Element    ${LINK_SIGNIN}
    Sleep   3
    Input Text    ${LOGIN_INPUT_EMAIL}      ${email}
    Input Password    ${LOGIN_INPUT_PASS}    ${password}
    Click Button    ${BUTTON_LOGIN}
    Wait Until Element Is Visible    ${ELEMENT_CUSTOMER_NAME}   timeout=15s
    Element Should Contain    ${ELEMENT_CUSTOMER_NAME}    ${name}

Search Product
    [Documentation]  Keyword for searching a product via search panel
    ...
    ...              Browser must be on home page
    [Arguments]      ${product}
    Click Element    ${SEARCH_PANEL}
    Input Text       ${SEARCH_PANEL}    ${product}
    Press Keys       ${SEARCH_PANEL}    ENTER
    Wait Until Element Is Visible    ${HEADER_SEARCH_RESULTS}   timeout=${DEFAULT_TIMEOUT}
    Element Should Contain    ${HEADER_SEARCH_RESULTS}   ${product}



    




