# http_server_ruby

NOTE: This thing isn't secure.

It's just for demo purposes.

Don't use this in production.

It's not even close to secure.

Why is it not secure?
1. Run `ruby server.rb` 
2. Run `curl -v http://localhost:2000/../server.rb --path-as-is`

The above command will literally return the contents of server.rb - that's bad. 