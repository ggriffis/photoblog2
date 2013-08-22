## SETUP INSTRUCTIONS:
1) bundle install
2) rake db:setup
3) Create an AWS S3 bucket (here are some instructions for how to do that: http://docs.aws.amazon.com/AmazonS3/latest/gsg/CreatingABucket.html)
4) Update your config/application.yml file with these three items related to your S3 bucket--with your won access key, secret access key, and bucket name--similar to the following

AWS_ACCESS_KEY_ID: "12341234123431234"
AWS_SECRET_ACCESS_KEY: "abcd+I/abcd1234abcd1234"
AWS_S3_BUCKET: "railscast-image-upload-example"

5) Start up the app "rails s"
6) Start up the redis database by typing in this command at a terminal prompt in the app directory (and just leave it running):

redis-server /usr/local/etc/redis.conf

7) Start up the background process by typing in this command at another terminal prompt (and leave it running as well):

bundle exec sidekiq

8) Create a Gallery
9) Click the "Choose File" button and select a photo
10) Click the "Upload Image" button and then enter a name for your photo
11) Click the "Update" button, which will kick off the background job to pull down your image from the AWS S3 bucket to display on the Gallery page, which you will be returned to.
12) You will likely see a box with "processing" and the name of your image underneath (unless the background job has already finished)
13) You can go look at the background process running in the terminal and watch it as it processes your images
14) Hit refresh on the webpage where the app is running and eventually your image should appear in thumbnail format


# Heroku app: http://gingerphotoblog2.herokuapp.com/
