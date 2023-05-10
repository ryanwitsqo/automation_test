*** Settings ***
Library     SeleniumLibrary


*** Test Cases ***
Negative Login Test
    Open Browser    https://www.saucedemo.com    chrome
    ${username_field_visible}    Run Keyword And Return Status    Element Should Be Visible    id=user-name
    IF    ${username_field_visible}
        Input Text    id=user-name    wrong_username
    ELSE
        Fail    Element with locator 'id=user-name' not found
    END
    ${password_field_visible}    Run Keyword And Return Status    Element Should Be Visible    id=password
    IF    ${password_field_visible}
        Input Text    id=password    wrong_password
    ELSE
        Fail    Element with locator 'id=password' not found
    END
    ${login_button_visible}    Run Keyword And Return Status    Element Should Be Visible    css=.btn_action
    IF    ${login_button_visible}
        Click Element    css=.btn_action
    ELSE
        Fail    Element with locator 'css=.btn_action' not found
    END
    ${error_button_visible}    Run Keyword And Return Status
    ...    Element Should Be Visible
    ...    xpath=//button[@class='error-button']
    IF    ${error_button_visible}
        Click Element    xpath=//button[@class='error-button']
    ELSE
        Fail    Error button with locator 'xpath=//button[@class='error-button']' not found
    END
