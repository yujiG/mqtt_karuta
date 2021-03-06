class UpdateKarutaJob < ApplicationJob
  MQTT_PORT = 1883
  MQTT_HOST = '127.0.0.1'
  QOS_LEVEL = 1
  MQTT_RETAIN = false

  def perform(game)
    next_karuta = game.update_next_karuta
    path = "karuta/#{game.key}/new_target_karuta"
    params = { karutaId: next_karuta.id, is_last: game.last_karuta? }.to_json
    client.publish(path, params, MQTT_RETAIN, QOS_LEVEL)
    # client.disconnect # comment out if necessary
    return if game.last_karuta?
    UpdateKarutaJob.set(wait: Game::INTERVAL).perform_later(game)
  end

  private

  def client
    return @client if @client.present?
    @client = PahoMqtt::Client.new
    @client.connect(MQTT_HOST, MQTT_PORT)
    @client
  end
end
