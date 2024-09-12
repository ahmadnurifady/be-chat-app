class Message < ApplicationRecord
    after_create_commit {broacast_message}

    private

    def broacast_message
        ActionCable.server.broadcast('MessagesChannel', {
            id:,
            body:
        })

    end
end
