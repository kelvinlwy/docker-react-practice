#multi-step 

# build phase

FROM node:alpine as build-stage
WORKDIR /app
COPY ./package.json .
RUN npm install
COPY ./ ./
RUN npm run build  # result is in /app/build

# run phase
FROM nginx
# copy data from other stage
COPY --from=build-stage /app/build /usr/share/nginx/html

