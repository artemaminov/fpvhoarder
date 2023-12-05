module Tg
    class Auth
        TOKEN = "6228282900:AAEwSSBJDIS-TYpTn73aKtewASSCFvwIq5U"

        def self.check(user)
            key = OpenSSL::Digest::SHA256.new.digest(TOKEN)
            hash = user.delete :hash
            data = user.to_unsafe_hash.map {|h| h.join "="}.sort.join "\n"
            hash == OpenSSL::HMAC.hexdigest('SHA256', key, data)
        end
    end

end
