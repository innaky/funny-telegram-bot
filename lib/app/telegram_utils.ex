defmodule TelegramUtils do
  def send_list_users([]) do
    []
  end

  def send_list_users([{username, userid, userdate}|t]) do
    [to_string(username) <> ", " <> to_string(userid) <> ", " <>
      to_string(userdate) | send_list_users(t)]
  end

  def concat_elems_list(_, [], end_character) do
    end_character
  end

  def concat_elems_list(character, [h|t], end_character) do
    to_string(h) <> character <> concat_elems_list(character, t, end_character)
  end

  def send_message_ids(text) do
    list_users_ids = :mnesia_tbot_app.get_users_ids()
    Enum.map(list_users_ids, fn user_id -> Nadia.send_message(user_id, text) end)
  end
end
