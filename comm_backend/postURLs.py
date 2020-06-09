import requests

# ngrok api tunnel endpoint
URL = "http://localhost:4040/api/tunnels"

# devio backend endpoint
devioBACKEND = "http://godseye-env.eba-gpcz6ppk.us-east-2.elasticbeanstalk.com/hubs/update"

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
post_cam0 = {
    "camera_name": "camera0",
    "camera_link": cam0_URL,
    "camera_password": "secret0"
}

post_cam1 = {
    "camera_name": "camera1",
    "camera_link": cam1_URL,
    "camera_password": "secret1"
}


# send post request and save response a response object
post_request0 = requests.post(url = devioBACKEND, data = post_cam0)
post_request1 = requests.post(url = devioBACKEND, data = post_cam0)



