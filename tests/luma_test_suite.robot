*** Settings ***
Resource    ../resources/luma_library.robot

Suite Setup         Open Luma
Suite Teardown      Close Browser

Test Setup          Go To Home Page

Test Tags           Search

*** Test Cases ***
Testing Successfull Products Selection
    [Documentation]  Test case that tests if selecting products to the cart success
    Select Product To Cart
    Choose Options To Item    S
    Add Product To Cart

