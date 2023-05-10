*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${BROWSER}      Chrome


*** Test Cases ***
Login Test
    Open Browser    https://www.saucedemo.com/    ${BROWSER}
    # error handler username
    ${EXCEPTION_OCCURRED}=    Run Keyword And Ignore Error    Element Should Be Visible    id=user-name
    IF    '${EXCEPTION_OCCURRED[0]}' == 'FAIL'
        Fail    ${EXCEPTION_OCCURRED[1]}
    END
    Run Keyword    Element Should Be Visible    id=user-name
    Input Text    id=user-name    standard_user
    # error handler password
    ${EXCEPTION_OCCURRED_PASSWORD}=    Run Keyword And Ignore Error    Element Should Be Visible    id=password
    IF    '${EXCEPTION_OCCURRED_PASSWORD[0]}' == 'FAIL'
        Fail    ${EXCEPTION_OCCURRED_PASSWORD[1]}
    END
    Run Keyword    Element Should Be Visible    id=password
    Input Password    password    secret_sauce
    Click Button    login-button
    Click Button    id=add-to-cart-sauce-labs-backpack
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div/div[1]/div[1]/div[3]/a
    Click Element    xpath=/html/body/div[1]/div/div/div[1]/div[1]/div[3]/a
    Click Button    id=checkout
    Input Text    id=first-name    ryan
    Input Text    id=last-name    witsqo
    Input Text    id=postal-code    144430
    Click Button    id=continue
    Scroll Element Into View    id=finish
    Click Button    id=finish
    Click Button    id=back-to-products
