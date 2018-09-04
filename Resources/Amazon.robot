*** Settings ***
Library  SeleniumLibrary


*** Keywords ***
Search for Products
    Go to  http://www.amazon.com
    Wait Until Page Contains  Your Amazon.com
    Input Text  id=twotabsearchtextbox  Ferrari 458
    Click button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    Wait Until Page Contains  results for "Ferrari 458"

Select Product from Search Results
    Click Link  css=#result_2 > div > div > div > div.a-fixed-left-grid-col.a-col-right > div.a-row.a-spacing-small > div:nth-child(1) > a
    Wait Until Page Contains  Back to search result
    Sleep  3s

Add product to Cart
    Click Button  xpath=//*[@id="add-to-cart-button-ubb"]
    Wait Until Page Contains  Added to Cart

Begin checkout
    Click Link  Proceed to checkout (1 item)
    #Page Should Contain Element  ap_signin1a_pagelet_title
    #Element Text Should Be  ap_signin1a_pagelet_title  Sign in