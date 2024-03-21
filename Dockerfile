FROM node:lts-alpine AS build

COPY . . 

RUN npm install
RUN npm run build 

FROM node:lts-alpine

COPY --from=build dist app

RUN npm install -g serve 

# change default user
RUN adduser -D rst
USER rst

CMD [ "serve", "app" ]
