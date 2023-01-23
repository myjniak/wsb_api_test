*** Settings ***
Library    authentication.py

*** Variables ***
# Te 'kredki' już nie działają ;)
# Musicie wygenerować je sobie na https://developer.spotify.com/dashboard/applications
${CLIENT_ID}    xxxxxxxxxxxxxxxxxxx
${CLIENT_SECRET}   yyyyyyyyyyyyyyyyyyyyyyy


*** Test Cases ***
Login To Spotify Should Work
    Login To Spotify    ${CLIENT_ID}     ${CLIENT_SECRET}