class PostsController < ApplicationController
  def index

    #when I attempt to change the post it messes up the test
    #can we update the text to test the redaction feature

    @posts = Post.all


    @posts.each_with_index do |post,index|
      if (index + 1) % 5 == 0
        #update post with title = "spam"
          post.title = "spam"
    #  else
    #    #do nothing
      end
    end

    #@posts (why is this not needed)



  end

  def show
  end

  def new
  end

  def edit
  end
end
