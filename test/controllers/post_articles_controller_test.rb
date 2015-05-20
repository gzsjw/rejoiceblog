require 'test_helper'

class PostArticlesControllerTest < ActionController::TestCase
  setup do
    @post_article = post_articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_article" do
    assert_difference('PostArticle.count') do
      post :create, post_article: { category: @post_article.category, image: @post_article.image, keywords: @post_article.keywords, notes: @post_article.notes, title: @post_article.title }
    end

    assert_redirected_to post_article_path(assigns(:post_article))
  end

  test "should show post_article" do
    get :show, id: @post_article
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post_article
    assert_response :success
  end

  test "should update post_article" do
    patch :update, id: @post_article, post_article: { category: @post_article.category, image: @post_article.image, keywords: @post_article.keywords, notes: @post_article.notes, title: @post_article.title }
    assert_redirected_to post_article_path(assigns(:post_article))
  end

  test "should destroy post_article" do
    assert_difference('PostArticle.count', -1) do
      delete :destroy, id: @post_article
    end

    assert_redirected_to post_articles_path
  end
end
