FROM node
RUN mkdir /code/
WORKDIR /code/
COPY package.json /code/
RUN npm install --prod
COPY . .
EXPOSE 8080
CMD [ "npm", "start" ]