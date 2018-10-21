FROM node:10-alpine
RUN mkdir /code/
WORKDIR /code/
COPY package.json /code/
RUN npm config set registry http://registry.npmjs.org/
RUN npm install
COPY . /code/
EXPOSE 8080
CMD [ "npm", "start" ]
