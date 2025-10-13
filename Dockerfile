FROM node:20-alpine

WORKDIR /nagasai

COPY . /nagasai

RUN npm install

EXPOSE 3000

CMD ["npm", "start"]

FROM python:3.9-slim
WORKDIR /app
COPY app.py /app
RUN pip install flask
EXPOSE 5000
CMD ["python", "app.py"]