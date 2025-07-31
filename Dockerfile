FROM nikolaik/python-nodejs:python3.13-nodejs20-slim

WORKDIR /app

RUN pip3 install supervisor

COPY . .

RUN curl -fsSL https://get.pnpm.io/install.sh | ENV="$HOME/.shrc" SHELL="$(which sh)" sh - && \
    cd ./app/src/nextjs-frontend && \
    . /root/.shrc && \
    npm run build

RUN pip3 install -r requirements.txt && \

CMD ["./run.sh"]
