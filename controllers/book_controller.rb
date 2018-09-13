class BookController < Sinatra::Base

    set :root, File.join(File.dirname(__FILE__), "..")
    set :view, Proc.new { File.join(root, "views") }

    configure :development do
        register Sinatra::Reloader
    end

    $books = [
    ]

    get "/" do
        @books = $books
        erb(:'books/index')
    end

    get "/new" do
        @books = $books #for navigation bar
        @book = {
            id: "",
            title: "",
            body: ""
        }
        erb(:'books/new')
    end

    get "/:id" do
        @books = $books
        @book = $books[params[:id].to_i]
        erb :"books/edit"
      end
    
    get "/delete/:id" do
        @books = $books
        @book = $books[params[:id].to_i]
        erb :"books/delete"
    end

    post "/" do
        new_book = {
            id: $books.length,
            title: params[:title],
            body: params[:body]
        }
        $books.push(new_book)
        redirect "/"
    end

    put "/:id" do
        book = $books[params[:id].to_i]
        book[:title] = params[:title]
        book[:body] = params[:body]
        redirect "/"
    end
    
    delete "/delete/:id" do
        $books.delete_at(params[:id].to_i)
        redirect "/"
    end


end