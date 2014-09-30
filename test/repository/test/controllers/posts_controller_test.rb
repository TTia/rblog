require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
	  @updated_post = {
			  title: 'Brand New Post!',
			  content: 'Sufficiently long post, with enough characters in it. Deal with it.'
	  }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: @updated_post
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test 'should not multiple create posts' do
	  assert_difference('Post.count') do
		  post :create, post: @updated_post
	  end
	  assert_no_difference('Post.count') do
		  post :create, post: @updated_post
	  end
  end

  test 'should not create post due to length requirements' do
		short_post = {
				title: 't' * (Post::min_title_length-1),
				content: 'c' * (Post::min_body_length-1)
		}
		long_post = {
				title: 't' * (Post::max_title_length+1),
		    content: 'c' * (Post::min_body_length+1)
		}
		assert_no_difference('Post.count') do
		  post :create, post: short_post
	  end
		assert_no_difference('Post.count') do
			post :create, post: long_post
		end
  end

  test 'should create post - border line length requirements' do
	  border_line_post = {
			  title: 't'*Post::min_title_length,
	      content: 'c'*Post::min_body_length
	  }
	  assert_difference('Post.count') do
		  post :create, post: border_line_post
	  end
	  border_line_post[:title] = 't'*Post::max_title_length
	  assert_difference('Post.count') do
		  post :create, post: border_line_post
	  end
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  test "should update post" do
    patch :update, id: @post, post: @updated_post
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
end
