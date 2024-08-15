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
    Run Keyword If    '${title}' != '${HOMEPAGE_TITLE}'
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




