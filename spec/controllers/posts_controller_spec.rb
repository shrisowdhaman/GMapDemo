require 'spec_helper'

describe PostsController do

  # This should return the minimal set of attributes required to create a valid
  # Post. As you add validations to Post, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {
      :name => "shrisowdhman",
      :title => "test title",
      :content => "text content"
    }
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PostsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all posts as @posts" do
      post = FactoryGirl.create(:post)
      get :index
      assigns(:posts).should eq([post])
    end
  end

  describe "GET show" do
    it "assigns the requested post as @post" do
      post = FactoryGirl.create(:post)
      get :show, {:id => post.to_param}
      assigns(:post).should eq(post)
    end
  end

  describe "GET new" do
    it "assigns a new post as @post" do
      get :new, {}
      assigns(:post).should be_a_new(Post)
    end
  end

  describe "GET edit" do
    it "assigns the requested post as @post" do
      post = FactoryGirl.create(:post)
      get :edit, {:id => post.to_param}
      assigns(:post).should eq(post)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, {:post => FactoryGirl.attributes_for(:post)}
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, {:post => FactoryGirl.attributes_for(:post)}
        assigns(:post).should be_a(Post)
        assigns(:post).should be_persisted
      end

      it "redirects to the created post" do
        post :create, {:post => FactoryGirl.attributes_for(:post)}
        response.should redirect_to(Post.last)
      end
     end

    describe "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        post :create, {:post => {}}
        assigns(:post).should be_a_new(Post)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        post :create, {:post => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested post" do
        post = FactoryGirl.create(:post)
        # Assuming there are no other posts in the database, this
        # specifies that the Post created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Post.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => post.to_param, :post => {'these' => 'params'}}
      end

      it "assigns the requested post as @post" do
        post = FactoryGirl.create(:post)
        put :update, {:id => post.to_param, :post => FactoryGirl.attributes_for(:post)}
        assigns(:post).should eq(post)
      end

      it "redirects to the post" do
        post = FactoryGirl.create(:post)
        put :update, {:id => post.to_param, :post => FactoryGirl.attributes_for(:post)}
        response.should redirect_to(post)
      end
    end

    describe "with invalid params" do
      it "assigns the post as @post" do
        post = FactoryGirl.create(:post)
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        put :update, {:id => post.to_param, :post => {}}
        assigns(:post).should eq(post)
      end

      it "re-renders the 'edit' template" do
        post = FactoryGirl.create(:post)
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        put :update, {:id => post.to_param, :post => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested post" do
      post = FactoryGirl.create(:post)
      expect {
        delete :destroy, {:id => post.to_param}
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = FactoryGirl.create(:post)
      delete :destroy, {:id => post.to_param}
      response.should redirect_to(posts_url)
    end
  end

end
