import requests

# ngrok api tunnel endpoint
URL = "http://localhost:4040/api/tunnels"
devioBACKEND = ""

# send get request and save the response as response object
r = requests.get(url = URL)

# extract data in json
data = r.json()

# parse the data to get the URLS
for elem in data['tunnels']:
    if elem['name'] == 'devio-cam0':
        cam0_URL = elem['public_url']
    if elem['name'] == 'devio-cam1':
        cam1_URL = elem['public_url']

# data to be sent to the backend
post_data = {
    "camera0": {
        "id": "test001",
        "link": cam0_URL,
        "password": "secret"
    },
    "camera1": {
        "id": "test002",
        "link": cam1_URL,
        "password": "secret"
    }
}

# send post request and save response a response object
# post_request = requests.post(url = devioBACKEND, data = post_data)



