# http_server_ruby

## NOTE: This thing isn't secure. Don't use in Production.

This is simply for demo & learning purposes.

## Usage

1. Start the server: `ruby server.rb`
2. Open the browser and go to `http://localhost:2000/`
3. Add a new file to `view/newfile.html`
4. Render the file in the browser via `http://localhost:2000/newfile.html`


## Why is it not secure?
1. Run `ruby server.rb` 
2. Run `curl -v http://localhost:2000/../server.rb --path-as-is`

The above command will literally return the contents of server.rb - that's bad. 