FROM gitpod/workspace-full
USER gitpod
RUN curl https://cli-assets.heroku.com/install.sh | sh
RUN apt remove libssl-dev
