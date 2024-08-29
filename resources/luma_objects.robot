*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${DEFAULT_BROWSER}                  Chrome
${DEFAULT_URL}                      https://magento.softwaretestingboard.com/
${DEFAULT_SPEED}                    0.5
${DEFAULT_TIMEOUT}                  15
${HOMEPAGE_TITLE}                   Home Page

${LINK_SHOPPINGCART}                xpath:/html/body/div[2]/header/div[2]/div[1]/a
${BUTTON_FIRST_ADDTOCART}           xpath:(//button[@title='Add to Cart'])[1]
${BUTTONS_ADDTOCART}                xpath://button[@title='Add to Cart']
${LINKS_PRODUCTITEM}                xpath://a[@class='product-item-link']
${LINK_FIRST_PRODUCTITEM}           xpath:(//a[@class='product-item-link'])[1]
${LINK_FIRST_PRODUCTITEMPHOTO}      xpath:(//a[@class='product-item-photo'])[1]
${PRODUCT_GRID}                     xpath://ol[contains(@class, 'product-items')]

${TEXT_PAGE_MESSAGES}               You need to choose options for your item.
${ELEMENT_PAGE_MESSAGES}            xpath://*[@id="maincontent"]/div[1]
${PRODUCT_TITLE}                    xpath://h1[@class='page-title']
${ELEMENT_FIRST_SELECT_SIZE}        xpath://*[@id="option-label-size-143-item-166"]
${ELEMENTS_SELECT_SIZE}             xpath://*[contains(@id, 'option-label-size-143-')]
${ELEMENTS_SELECT_COLOR}            xpath://*[contains(@id,"option-label-color-93-")]
${ELEMENTS_FIRST_SELECT_COLOR}      xpath://*[@id="option-label-color-93-item-50"]
${BUTTON_PRODUCT_ADDTOCART}         xpath://*[@id="product-addtocart-button"]

${LINK_CREATE_ACCOUNT}              xpath:/html/body/div[2]/header/div[1]/div/ul/li[3]/a
${TITLE_CREATE_ACCOUNT_PAGE}        Create New Customer Account
${URL_CREATE_ACCOUNT}               customer/account/create/

${INPUT_FIRSTNAME}                  //*[@id="firstname"]
${INPUT_LASTNAME}                   //*[@id="lastname"]
${INPUT_EMAIL}                      //*[@id="email_address"]
${INPUT_PASSWORD}                   //*[@id="password"]
${INPUT_CONFIRM_PASSWORD}           //*[@id="password-confirmation"]
${BUTTON_CREATE_ACCOUNT}            //*[@id="form-validate"]/div/div[1]/button
${MAGE_ERRORS}                      //*[@class= 'mage-error']
${TEXT_ACCOUNT_CREATED}             Thank you for registering with Main Website Store.

${ACCOUNT_INFORMATION}              //*[@id="maincontent"]/div[2]/div[1]/div[3]/div[2]/div/div[1]

${BUTTON_CUSTOMER_MENU}             xpath:/html/body/div[2]/header/div[1]/div/ul/li[2]/span/button
${ELEMENT_CUSTOMER_NAME}            xpath:/html/body/div[2]/header/div[1]/div/ul/li[1]/span
${LINK_SIGNOUT}                     (//a[contains(text(), 'Sign Out')])[1]
${LINK_SIGNIN}                      (//a[contains(text(), 'Sign In')])[1]

${LOGIN_INPUT_EMAIL}                //*[@id="email"]
${LOGIN_INPUT_PASS}                 //*[@id="pass"]
${BUTTON_LOGIN}                     //*[@id="send2"]

${SEARCH_PANEL}                     //*[@id="search"]
${HEADER_SEARCH_RESULTS}            //*[@id="maincontent"]/div[1]/h1/span
${SECTION_SEARCH_RESULTS}           //*[@id="maincontent"]/div[3]/div[1]/div[2]
${MESSAGE_NO_SEARCH_RESULTS}        Your search returned no results.
${TOOLBAR_AMOUNT}                   //*[@id="toolbar-amount"]