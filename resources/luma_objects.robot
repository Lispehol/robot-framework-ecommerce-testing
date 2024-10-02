*** Settings ***
Documentation                       Page objects of Luma demo store

*** Variables ***
${DEFAULT_BROWSER}                  Chrome
${DEFAULT_URL}                      https://magento.softwaretestingboard.com/
${DEFAULT_SPEED}                    0.5
${DEFAULT_TIMEOUT}                  15
${HOMEPAGE_TITLE}                   Home Page

${LINK_SHOPPINGCART}                //a[@class='action showcart']
${VIEW_EDIT_CART}                   //span[text()='View and Edit Cart']
${BUTTON_FIRST_ADD_TO_CART}         xpath:(//button[@title='Add to Cart'])[1]
${BUTTONS_ADD_TO_CART}              xpath://button[@title='Add to Cart']
${LINKS_PRODUCT_ITEM}               xpath://a[@class='product-item-link']
${LINK_FIRST_PRODUCT_ITEM}          xpath:(//a[@class='product-item-link'])[1]
${LINK_FIRST_PRODUCT_ITEM_PHOTO}    xpath:(//a[@class='product-item-photo'])[1]
${PRODUCT_GRID}                     xpath://ol[contains(@class, 'product-items')]

${TEXT_PAGE_MESSAGES}               You need to choose options for your item.
${ELEMENT_PAGE_MESSAGES}            xpath://*[@id="maincontent"]/div[1]
${PRODUCT_TITLE}                    xpath://h1[@class='page-title']
${PRODUCT_ITEM_NAME}                //*[@id="shopping-cart-table"]/tbody/tr[1]/td[1]/div
${ELEMENT_FIRST_SELECT_SIZE}        xpath://*[@id="option-label-size-143-item-166"]
${ELEMENTS_SELECT_SIZE}             xpath://*[contains(@id, 'option-label-size-143-')]
${ELEMENTS_SELECT_COLOR}            xpath://*[contains(@id,"option-label-color-93-")]
${ELEMENTS_FIRST_SELECT_COLOR}      xpath://*[@id="option-label-color-93-item-50"]
${BUTTON_PRODUCT_ADD_TO_CART}       xpath://*[@id="product-addtocart-button"]

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
${LOGIN_MESSAGE}                    //*[contains(@class, 'page messages')]
${LOGIN_MESSAGE_TEXT_ERROR}         The account sign-in was incorrect or your account is disabled temporarily. Please wait and try again later.

${SEARCH_PANEL}                     //*[@id="search"]
${HEADER_SEARCH_RESULTS}            //*[@id="maincontent"]/div[1]/h1/span
${SECTION_SEARCH_RESULTS}           //*[@id="maincontent"]/div[3]/div[1]/div[2]
${MESSAGE_NO_SEARCH_RESULTS}        Your search returned no results.
${TOOLBAR_AMOUNT}                   //*[@id="toolbar-amount"]

${LINK_SUBSCRIBE}                   //a[text()='Subscribe']
${SUBSCRIBE_INPUT_EMAIL}            //*[@id="mce-EMAIL"]
${SUBSCRIBE_SUBMIT}                 //*[@id="mc-embedded-subscribe"]
${SUBSCRIBE_RESPONSE_SUCCESS}       //*[@id="mce-success-response"]
${SUBSCRIBE_RESPONSE_ERROR}         //*[@id="mce-error-response"]
${SUBSCRIBE_EMAIL_ERROR}            //*[text() = 'Please enter a valid email address.']