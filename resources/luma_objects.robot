*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${DEFAULT_BROWSER}                  Chrome
${DEFAULT_URL}                      https://magento.softwaretestingboard.com/
${DEFAULT_SPEED}                    0.3
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
