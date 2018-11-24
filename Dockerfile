FROM node:10-alpine
RUN mkdir /code/
WORKDIR /code/
COPY package.json /code/
RUN echo "151.101.16.162 registry.npmjs.org" >> /etc/hosts
RUN npm install
COPY . .
EXPOSE 8080
CMD [ "npm", "start" ]