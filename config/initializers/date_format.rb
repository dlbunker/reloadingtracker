class ActiveSupport::TimeWithZone
    def as_json(options = {})
        strftime('%m-%d-%Y %H:%M:%S %z')
    end
end
