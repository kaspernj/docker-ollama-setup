# Install

## Nvidia toolkit for Docker

To setup Nvidia for Docker follow the instructions here: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html

## Stable Diffusion in OpenWebUI

After running `docker compose up` initially, shut it off and run this command:

```bash
chmod 777 stable-diffusion/models/
```

Click username in bottom left corner -> Admin panel -> Images.

Enter the following.

URL: http://stable-diffusion-webui:8080
Api Auth String: The username and password combination set in the .env file.
