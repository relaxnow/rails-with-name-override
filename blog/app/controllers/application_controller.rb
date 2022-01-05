class ApplicationController < ActionController::Base
    def self.name
        raise NotImplementedError.new("You must implement me")
    end
end
