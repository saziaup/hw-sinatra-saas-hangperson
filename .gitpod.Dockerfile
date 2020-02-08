FROM gitpod/workspace-full
USER gitpod
RUN curl https://cli-assets.heroku.com/install.sh | sh
USER root
RUN apt remove libssl-dev
