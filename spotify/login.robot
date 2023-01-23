*** Settings ***
Library    authentication.py

*** Variables ***
# Te 'kredki' już nie działają ;)
# Musicie wygenerować je sobie na https://developer.spotify.com/dashboard/applications
${CLIENT_ID}    7e37d867075d4a14a5b233e0f60ae602
${CLIENT_SECRET}    ab56c41b388242959070880c9b104cea


*** Test Cases ***
Login To Spotify Should Work
    Login To Spotify    ${CLIENT_ID}     ${CLIENT_SECRET}