FROM node
RUN mkdir /code/
WORKDIR /code/
COPY . .
EXPOSE 8080
CMD [ "npm", "start" ]
