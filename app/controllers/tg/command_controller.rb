module Tg
    class CommandController < ApplicationController

        TOKEN = Rails.application.credentials.tg_token
        API_URL = "https://api.telegram.org/bot" + TOKEN

        COMMANDS = %w[getMe sendMessage sendPhoto sendMediaGroup deleteMessage]
        TYPES = %w[photo video]

        def send_to_tg
            command = params.delete(:command)
            if (COMMANDS.include?(command))
                # debugger
                response = connection.post(command, payload)
                render plain: response.to_json
            end
        end

        private

        def payload
            @uploads = {}
            compose_payload.merge @uploads
        end

        def compose_payload
            {
                media: compose_media,
                chat_id: "-901342273",
            }
        end

        def compose_media
            media = []
            uploads = params[:uploads]
            uploads.each do |upload|
                unless upload.blank?
                    media.push({
                        type: upload_type(upload),
                        media: "attach://" + upload.original_filename,
                        caption: params[:text]
                    })
                    add_upload(upload)
                end
            end
            media.to_json
        end

        def add_upload(file)
            @uploads[file.original_filename] = Faraday::Multipart::FilePart.new(File.expand_path(file.tempfile), file.content_type)
        end

        def upload_type(file)
            case file.content_type
            when /^video/
                "video"
            when /^image/
                "photo"
            end
        end

        def connection
            Faraday.new(url: API_URL) do |f|
                f.response :logger,
                    Rails.logger,
                    headers: true,
                    bodies: true,
                    log_level: :debug
                f.request :multipart
            end
        end
    
    end
end