
#Specify a base Image

FROM node:alpine as builderB
# Install some dependecies
 WORKDIR "/app"
#copy just the package.json  and run npm instal in case there are changes
 COPY ./package.json ./  
 RUN npm install

 COPY ./ ./

 # Default  command to run
  #RUN npm run build
#CMD ["npm","run","build"]
RUN npm run build
#npm run build
#COPY ./ ./
FROM nginx
COPY --from=builderB /app/build /usr/share/nginx/html
