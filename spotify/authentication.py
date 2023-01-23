import base64
import requests
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn


@keyword(name="Login To Spotify")
def login(client_id, client_secret):
    """Bardzo popularny typ autentykacji.
    Różnice między API to przede wszystkim URL, i wymagany format data.
    Headery w innych API są raczej bardzo podobne (lub takie same).
    """
    base_url = "https://accounts.spotify.com"
    endpoint = "/api/token"
    full_url = base_url + endpoint
    # unencoded_client_creds = client_id + ":" + client_secret
    unencoded_client_creds = f"{client_id}:{client_secret}"
    encoded_client_creds = base64.b64encode(unencoded_client_creds.encode()).decode()
    response = requests.post(full_url,
                             data={"grant_type": "client_credentials"},
                             headers={"Content-Type": "application/x-www-form-urlencoded",
                                      "Authorization": f"Basic {encoded_client_creds}"}
                             )
    token = response.json()["access_token"]
    BuiltIn().set_global_variable("TOKEN", token)  # Będziemy potrzebowali tokena później, do zapytań.
    return token
