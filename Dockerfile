FROM node:latest
RUN mkdir /code/
WORKDIR /code/
COPY package.json /code/
RUN npm install
COPY . /code/
EXPOSE 8080
CMD [ "npm", "start" ]
