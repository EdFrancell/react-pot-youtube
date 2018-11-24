FROM node:10-alpine
RUN mkdir /code/
WORKDIR /code/
COPY package.json /code/
RUN npm config set registry https://registry.npmjs.org/
RUN npm install
COPY . .
EXPOSE 8080
CMD [ "npm", "start" ]