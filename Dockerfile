FROM python:3.10-alpine

# Adding git, bash and openssh to the image
RUN apk update && apk upgrade && \
    apk add --no-cache bash curl

# Change localtime
RUN cp /usr/share/zoneinfo/Europe/Andorra /etc/localtime
RUN echo "Europe/Andorra" > /etc/timezone

# Copy script
RUN mkdir /scrapyrealestate/
ADD . /scrapyrealestate/
WORKDIR /scrapyrealestate/scrapyrealestate/

# upgrade pip and install requirements
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8080

CMD ["python", "./main.py"]