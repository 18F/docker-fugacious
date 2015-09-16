Fugacious with Google Oauth Proxy via NGINX
=========
Easily stand up Fugacious, a solution for secure, short-term messaging behind nginx and [Bitly's Google Oauth Proxy](https://github.com/bitly/google_auth_proxy).

Dependencies
---

- [Fig](http://www.fig.sh/)

- [Docker](https://docs.docker.com/installation/#installation)

- An Oauth registration with Google, easily created by following [these instructions](https://github.com/bitly/google_auth_proxy#oauth-configuration). Be sure to record the ```Client ID``` and ```Client Secret``` as they'll be needed in the next step.


Usage
---

These instructions assume a Debian-based Linux system such 18F's [FISMA Ready Ubuntu LTS](https://github.com/fisma-ready/ubuntu-lts). However, other distributions will likely work with few if any modifications.

1. Install Docker.

		curl -sSL https://get.docker.com/ubuntu/ | sudo sh

2. Install Fig.

		curl -L https://github.com/docker/fig/releases/download/1.0.1/fig-`uname -s`-`uname -m` > /usr/local/bin/fig; chmod +x /usr/local/bin/fig

3. Clone the repository.

		git clone git@github.com:18F/docker-fugacious.git

		cd docker-fugacious

4. Set each of the necessary environment variables described in ```env.sh```, most notably the ```GOOGLE_AUTH_PROXY_CLIENT_ID``` and ```GOOGLE_AUTH_PROXY_CLIENT_SECRET``` which must be set to the ```Client ID``` and ```Client Secret``` recorded above. Complete the environment setup by running the resulting populated script.

		sh env.sh

5. Build the containers. The containers would be built automatically on first run, but getting this out of the way now keeps things nice and neat.

		sudo fig build

6. Prepare the database for first use and start the containers.

		sh start.sh

Roadmap
---

- SSL configuration of frontend nginx.
- Add Ansible / Chef deployment scripts with handling of ENV setup via Vault / Citadel.
- Add [FISMA Ready nginx](https://github.com/fisma-ready/nginx) configuration to each instance of nginx in the stack.
- Replace public images with private builds on Quay.

Contributing
---

1. Fork it
2. Create your feature branch (`git checkout -b feature/my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### Public domain

This project is in the worldwide [public domain](LICENSE.md). As stated in [CONTRIBUTING](CONTRIBUTING.md):

> This project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).
>
> All contributions to this project will be released under the CC0 dedication. By submitting a pull request, you are agreeing to comply with this waiver of copyright interest.
