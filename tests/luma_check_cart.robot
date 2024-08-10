*** Settings ***
Resource    ../resources/luma_library.robot
Test Setup      Open Luma
Test Teardown   Close Browser

*** Test Cases ***
Testing Search
    Select Product To Cart
    Choose Options To Item    S
    Add Product To Cart
