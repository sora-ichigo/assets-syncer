FROM ruby:3.1.1

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" \
  && unzip awscliv2.zip \
  && ./aws/install \
  && mkdir /app

WORKDIR /app

CMD ["ruby", "job/sync_s3.rb"]
