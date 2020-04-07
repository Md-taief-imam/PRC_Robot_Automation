*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://sqa.grp.gov.bd/global/web/dashboard
${browser}        gc
@{procurement_entity}    mors0001    123456789    ashok@bcc.gov.bd    123456789

*** Test Cases ***
Login PRC
    Login PRC
    Close All Browsers

OPM - DCP
    Login PRC
    OPM - DCP
    Close All Browsers

PE - Check User role
    [Documentation]    It Checks how many user role assigned yet now and how a user assigned in a role
    Login PRC
    PE - Check User role

PE - Select PRC role and display PRC post
    [Documentation]    It checks how many people assigned as PRC Entity(PE)
    Login PRC
    PE - Select PRC role and display PRC post

PE - assign employee to any post
    [Documentation]    PE assigned a post to a new user
    PE - assign employee to any post

PE - edit and delete any post
    [Documentation]    After assigned any post PE can edit and delete any assigned post
    Login PRC
    PE - edit and delete any post
    Close All Browsers

*** Keywords ***
Login PRC
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Input Text    (//input[@name='username'])    ${procurement_entity}[0]
    Sleep    2    123456789
    Input Text    (//input[@name='password'])    ${procurement_entity}[1]
    Sleep    2
    Click Element    (//button[@class='btn btn-primary px-4'])
    Sleep    4
    #Click Element    //div/button[contains(text(),'উপসচিব, কার্যনির্বাহী শাখা')]
    #Sleep    2
    Click Element    (//img[@src='assets/img/brand/procurement.svg'])
    Sleep    4

OPM - DCP
    [Documentation]    _From Procurement Module - Procuring Entity(PE) \ can add item, add other info and save and finally PE can edit /update the OPM untill the status is 'NEW'_
    Click Element    (//i[@class='nav-icon fa fa-angle-down'])[5]
    Sleep    2
    Click Element    //a/i[@class='nav-icon fa fa-money']
    Sleep    2
    Click Element    //span[@class='mat-button-wrapper']
    Sleep    2
    Click Element    (//div[@class='mat-select-arrow-wrapper'])[1]
    Sleep    2
    Click Element    (//span[@class='mat-option-text'])[2]
    Sleep    2
    Click Element    (//div[@class='mat-select-arrow-wrapper'])[3]
    Sleep    2
    Click Element    (//span[@class='mat-option-text'])[1]
    Sleep    2
    Input Text    (//input[@placeholder='রেফারেন্স নং'])[1]    PRC/TEST/001
    Sleep    2
    Input Text    (//div/textarea[@placeholder='বিবরণ'])[1]    This is automatically inputed
    Sleep    2
    Input Text    (//div/textarea[@placeholder='মন্তব্য'])[1]    Test By SQA(Taief)
    Click Element    (//button[@class='btn btn-pill btn-block custom-add-item'])[1]
    Sleep    2
    Click Element    (//div[@class='mat-select-arrow-wrapper'])[4]
    Sleep    2
    Click Element    (//span[@class='mat-option-text'])[7]
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[3]
    Sleep    2
    Input Text    (//input[@id='requestedQuantity'])[1]    2
    Sleep    2
    Input Text    (//input[@id='requestedQuantity'])[2]    4500
    Sleep    2
    Input Text    (//input[@id='requestedQuantity'])[3]    Test 1 Data
    Sleep    2
    Click Element    (//mat-icon[@class='mat-icon notranslate material-icons mat-icon-no-color'])[1]
    Sleep    2
    Input Text    (//input[@id='requestedQuantity'])[4]    3
    Sleep    2
    Input Text    (//input[@id='requestedQuantity'])[5]    500
    Sleep    2
    Input Text    (//input[@id='requestedQuantity'])[6]    Test 2 Data
    Sleep    2
    Click Element    (//mat-icon[@class='mat-icon notranslate material-icons mat-icon-no-color'])[2]
    Sleep    2
    Click Element    (//button[@class='mat-button mat-button-base'])    #item add pop up shut down
    Sleep    2
    #Click Element    (//i[@class='fa fa-map-marker'])[1]
    #Sleep    2
    #Click Element    (//span[@class='mat-button-wrapper'])[12]
    #Sleep    2
    #Click Element    (//i[@class='fa fa-pencil-square-o'])[1]
    #Sleep    2
    #Clear Element Text    //input[@placeholder='পরিমাণ']
    #Sleep    2
    #Input Text    //input[@placeholder='পরিমাণ']    3
    #Sleep    2
    #Click Element    (//button[@class='btn btn-cus-success'])
    #Sleep    2
    Input Text    (//input[@formcontrolname='discount'])    4    #discount
    Sleep    2
    Input Text    (//input[@formcontrolname='vat'])    3    #vat
    Sleep    2
    Input Text    (//input[@formcontrolname='ait'])    2    #ait
    Sleep    2
    Click Element    (//i[@class='fa fa-save'])    \    #হালনাগাদ করুন
    Sleep    3
    Click Element    (//button[@class='btn btn-cus-success btn-md'])
    Sleep    3

PE - Check User role
    Click Element    (//i[@class='nav-icon fa fa-tachometer'])
    Sleep    2
    Click Element    (//i[@class='nav-icon fa fa-angle-down'])[1]
    Sleep    2
    Click Element    (//i[@class='nav-icon fa fa-user'])[1]
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[97]
    Sleep    2
    Click Element    (//i[@class='fa fa-arrow-left'])
    Sleep    2

PE - Select PRC role and display PRC post
    Click Element    (//a[@class='nav-link nav-dropdown-toggle'])[2]    #Settings
    Sleep    2
    Click Element    link=প্রকিউরিং পোস্ট    #Procuring post
    Sleep    2
    Click Element    (//div[@class='mat-select-arrow-wrapper'])
    Sleep    2
    Click Element    (//span[@class='mat-option-text'])[2]
    Sleep    2

PE - assign employee to any post
    Click Element    (//i[@class='fa fa-plus'])
    Sleep    2
    Click Element    (//div[@class='mat-select-arrow'])[1]
    Sleep    2
    Click Element    (//span[@class='mat-option-text'])[2]
    Sleep    2
    Click Element    (//div[@class='mat-select-arrow'])[2]
    Sleep    2
    Click Element    (//span[@class='mat-option-text'])[1]
    Sleep    2
    Click Element    (//div[@class='mat-select-arrow'])[3]
    Sleep    2
    Click Element    (//span[@class='mat-option-text'])[1]
    Sleep    2
    Input Text    (//input[@placeholder='পোস্টের নাম (ইংলিশ)'])    SQA Post
    Sleep    2
    Input Text    (//input[@placeholder='পোস্টের নাম (বাংলা)'])    এস কিউ পোস্ট
    Sleep    2
    Click Element    (//div[@class='mat-select-arrow'])[4]
    Sleep    2
    Click Element    (//span[@class='mat-option-text'])[49]
    Sleep    2
    Click Element    (//div[@class='mat-select-arrow'])[5]
    Sleep    2
    Click Element    (//span[@class='mat-option-text'])[2]
    Sleep    2
    Click Element    (//i[@class='fa fa-save'])
    Sleep    2
    Click Element    (//button[@class='btn btn-cus-success btn-md'])
    Sleep    2

PE - edit and delete any post
    Click Element    (//a[@class='nav-link nav-dropdown-toggle'])[2]
    Sleep    2
    Click Element    link=প্রকিউরিং পোস্ট    #edit prc post \
    Sleep    2
    Click Element    (//div[@class='mat-select-arrow-wrapper'])
    Sleep    2
    Click Element    (//span[@class='mat-option-text'])[2]
    Sleep    3
    Click Element    (//span[@class='mat-button-wrapper'])[5]
    Sleep    2
    Clear Element Text    (//input[@placeholder='পোস্টের নাম (ইংলিশ)'])
    Sleep    2
    Input Text    (//input[@placeholder='পোস্টের নাম (ইংলিশ)'])    Updated Post New
    Sleep    2
    Clear Element Text    (//input[@placeholder='পোস্টের নাম (বাংলা)'])
    Sleep    2
    Input Text    (//input[@placeholder='পোস্টের নাম (বাংলা)'])    আপডেটেড \ পোস্ট New
    Sleep    2
    Click Element    (//i[@class='fa fa-save'])    #save
    Sleep    2
    Click Element    (//button[@class='btn btn-cus-success btn-md'])
    Sleep    2
    Click Element    (//div[@class='mat-select-arrow-wrapper'])    #delete prc post \
    Sleep    2
    Click Element    (//span[@class='mat-option-text'])[2]
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[6]
    Sleep    2
    Click Element    (//button[@class='btn btn-cus-success btn-md'])
    Sleep    2
