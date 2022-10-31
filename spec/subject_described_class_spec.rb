class MyLogger
  attr_reader :messages

  def initialize
    @messages = []
  end

  def log(message)
    @messages << message
    message
  end

  def messages_count
    @messages.count
  end
end

describe MyLogger do
  subject(:logger) { described_class.new }
  let(:message1) { 'Hello World' }
  let(:message2) { 'Ruby is awesome!' }

  it 'logs a message' do
    logged_message = logger.log(message1)
    expect(logged_message).to include 'Hello World'
  end

  context 'for logging' do
    let(:message1) { 'Other message' }

    before do
      logger.log(message1)
      logger.log(message2)
    end

    it 'adds message to messages array' do
      expect(logger.messages).to include message1
      expect(logger.messages).to include message2
    end

    it 'adds message to messages array 2' do
      # ARRANGE
      message1 = 'Hello World'
      message2 = 'Ruby is awesome'
      logger = MyLogger.new

      # ACT
      logger.log(message1)
      logger.log(message2)

      # ASSERT
      expect(logger.messages).to include message1
      expect(logger.messages).to include message2
    end

    it 'returns messages count' do
      expect(logger.messages_count).to eq 2
    end
  end

end
