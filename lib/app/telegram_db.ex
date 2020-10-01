defmodule TelegramDb do
  def start() do
    create([node()])
  end

  def create(nodes) do
    File.cd("mnesia")
    :mnesia_tbot_app.install(nodes)
    File.cd("..")
  end
end
