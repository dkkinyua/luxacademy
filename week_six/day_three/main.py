import requests

url = 'https://api.github.com/users/dkkinyua'
response = requests.get(url)

if response.status_code == 200:
    data = response.json()
    profile = {
        'name': data.get('name'),
        'username': data.get('login'),
        'date_created': data.get('created_at') 
    }

    for key, value in profile.items():
        print(f"{key}: {value}")
else:
    print(f"There is an error: {response.status_code}")

#print(response)