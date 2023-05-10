*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${BROWSER}      Chrome
${URL}          https://www.saucedemo.com/
${USERNAME}     standard_user
${PASSWORD}     secret_user


*** Test Cases ***
Login Test
    Open Browser    ${URL}    ${BROWSER}
    # Error handling for username
    ${EXCEPTION_OCCURRED}=    Run Keyword And Ignore Error    Element Should Be Visible    id=user-name
    IF    '${EXCEPTION_OCCURRED[0]}' == 'FAIL'
        Fail    ${EXCEPTION_OCCURRED[1]}
    END
    Run Keyword    Element Should Be Visible    id=user-name
    Input Text    id=user-name    ${USERNAME}
    # Error handling for password
    ${EXCEPTION_OCCURRED_PASSWORD}=    Run Keyword And Ignore Error    Element Should Be Visible    id=password
    IF    '${EXCEPTION_OCCURRED_PASSWORD[0]}' == 'FAIL'
        Fail    ${EXCEPTION_OCCURRED_PASSWORD[1]}
    END
    Run Keyword    Element Should Be Visible    id=password
    Input Password    id=password    ${PASSWORD}
    Click Button    login-button
