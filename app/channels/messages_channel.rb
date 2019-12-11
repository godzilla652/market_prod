class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams

    stream_from broadcasting_name(connect_params)
    ConnectedList.add(current_user.id)
  end

  def unsubscribed
    ConnectedList.remove(current_user.id)
  end

  def receive(data)
    #to = data['to'].to_s

    if ConnectedList.include?(current_user.id)
      relay_message(connect_params, data)
    else
      intended_recipient_not_found(connect_params)
    end
  end

  private

  def connect_params
    params
  end

  def broadcasting_name(data)
    "mesh_relay_#{data["chatroom_id"]}"
  end

  def intended_recipient_not_found(to)
    ActionCable.server.broadcast(
        broadcasting_name(connect_params),
        status: 404,
        detail: to,
        error: "Member not found")
  end

  def relay_message(connect_params, data)

    message = Message.create(
        message_body: data['body'],
        suggestion_id: data['chatroom_id'],
        author: current_user,
        file: data['file']
    )

    # author_flag = message.author?(current_user)
    # chat_room = ChatRoom.find(data['chatroom_id'])
    #
    # recipient = Task.find(chat_room.task_id).user_id if chat_room.creator == current_user
    # recipient = chat_room.creator.id unless chat_room.creator == current_user

    # feed = FeedNotification.create(
    #   entity_id: data['chatroom_id'],
    #   author_id: current_user.id,
    #   recipient_id: recipient,
    #   task_id: chat_room.task_id,
    #   notification_type: 'private',
    #   message: message.body
    # )

    # if feed.save!
    #   NotificationsWorker.perform_async(feed.id)
    #   chat_room.update_attribute("#{message.user_role(recipient)}_read".to_sym, false)
    # end

    # if message.save!
    #   ActionCable.server.broadcast(
    #       broadcasting_name(connect_params),
    #       message: message.as_json.merge({is_owner: author_flag})
    #   )
  end
end
#end

# frozen_string_literal: true
# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
#
# A channel is created from a Connection.
# so the uid is delegated to the Connection
# class MeshRelayChannel < ApplicationCable::Channel
#   def subscribed
#     stop_all_streams
#     stream_from broadcasting_name
#     ConnectedList.add(uid)
#   end
#
#   def unsubscribed
#     ConnectedList.remove(uid)
#   end
#
#   # messages received from the clients are handled here. :-)
#   def chat(data)
#     # uid of the intended recipient
#     # only the intended recipient will be able to decrypt
#     to = data['to'].to_s
#
#     if ConnectedList.include?(to)
#       relay_message(to, data)
#     else
#       intended_recipient_not_found(to)
#     end
#   end
#
#   private
#
#   def broadcasting_name(data)
#     "mesh_relay_#{data["chatroom_id"]}"
#   end
#
#   def intended_recipient_not_found(to)
#     ActionCable.server.broadcast(
#         broadcasting_name,
#         status: 404,
#         detail: to,
#         error: "Member with UID #{to} could not be found")
#   end
#
#   # broadcast the message to the channel
#   # that the to client is subscribed to.
#   def relay_message(to, data)
#     encrypted_message = data['message']
#
#     ActionCable.server.broadcast(
#         broadcasting_name(to),
#         message: encrypted_message,
#         uid: to)
#   end
# end
