require 'logger'
require 'fileutils'

LOG_OUT = './logs/stdout.log'

FileUtils.mkdir_p('./logs') unless FileTest.exist?('./logs')
FileUtils.touch(LOG_OUT) unless FileTest.exist?(LOG_OUT)

file = File.open(LOG_OUT, 'r+')

logger = Logger.new(file)

logger.info('pull s3 objects.')

system('./pull_images.sh')

logger.info('starting sync...')

loop do
  system('./sync_images.sh')

  sleep 5

rescue StandardError => e
  logger.error(e)
  break
end

logger.info('stoped sync.')
