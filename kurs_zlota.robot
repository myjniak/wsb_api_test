*** Settings ***
Library    RequestsLibrary
Library    utils.py


*** Test Cases ***
Get Current Gold Price
    ${response}    GET    http://api.nbp.pl/api/cenyzlota
    Log To Console    ${response.json()[0]["cena"]}


Lack Of Data When Correct Dates Are Given, Error 404 Should Happen
    [Tags]    Negative
    ${response}    GET    https://api.nbp.pl/api/cenyzlota/2003-01-02/2003-01-20    expected_status=404
    Should Contain   ${response.text}    brak danych    ignore_case=${True}


Structure Of Table C Should Be As Expected
    ${response}    GET    https://api.nbp.pl/api/exchangerates/rates/c/usd/last/10
    ${pretty}   Pretty Json    ${response.json()}

    # przykład użycia keyworda na weryfikację, zakomentowane, bo działało tylko 19.01.2023:
    # Should Be Equal As Numbers    ${response.json()["rates"][0]["ask"]}    4.4342

    # ZADANIE :D  Użyj     Should Be Equal    albo     Should Be True     do walidacji klucza code i table
