require_relative '../app/application.rb'

class Application

    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)

      if req.path.match(/items/)
        param = req.params[""]
        title = req.path.split("/items/").last

        if Item.all.find{|s| s.name == title}
            resp.write Item.all.find{|s| s.name == title}.price
        else
            resp.status = 400
            resp.write "Item not found"  
        end

      else
        resp.write "Route not found"
        resp.status = 404
      end
  
      resp.finish
    end
  end 