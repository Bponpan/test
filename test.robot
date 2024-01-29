*** Settings ***
Documentation   This is a sample test suite using Robot Framework
Library    SeleniumLibrary
Suite Setup    Open Browser   'http://automationexercise.com'

*** Variables ***
${nameproduct}    

*** Keywords ***
Click product button
    Click Button    //*[@id="header"]/div/div/div/div[2]/div/ul/li[2]/a

Input nameproduct
    [Arguments]   ${nameproduct}
    Input Text   //*[@id="search_product"]  ${nameproduct}

Click search button
    Click Button   //*[@id="submit_search"]

Element Should Be Visible
    [Arguments]
    Element Should Be Visible 


Click Cart
    Click Button   /html/body/section[2]/div[1]/div/div[2]/div/div[2]/div/div[1]/div[2]/div/a

Click login
    Click Button   //*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a

Submit login
    [Arguments]  
    Submit Form  None


*** Test Cases ***
search product 
    [Documentation]   Test Search Products and Verify Cart After Login
    Click product button
    Page Should Contain  ALL PRODUCTS
    Input nameproduct    ${nameproduct}
    Click search button
    Page Should Contain  SEARCHED PRODUCTS
    Element Should Be Visible 

    Click Cart
    Element Should Be Visible

    Click login
    Submit Form

