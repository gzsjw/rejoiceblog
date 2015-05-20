class PostArticlesController < ApplicationController
  before_action :set_post_article, only: [:edit, :update, :destroy, :next, :previous]

  # GET /post_articles
  # GET /post_articles.json
  def index
    if params[:set_locale]
      redirect_to post_articles_url(locale: params[:set_locale])
    else
      @post_articles = PostArticle.order(created_at: :desc)
    end
  end

  # GET /post_articles/1
  # GET /post_articles/1.json
  def show
    if params[:id] 
      set_post_article
    else
      @post_articles = PostArticle.order(created_at: :desc).limit(1)
      if !(@post_articles.empty?)
        @post_article = @post_articles[0]
      end
    end
  end

  # GET /post_articles/new
  def new
    @post_article = PostArticle.new
  end

  # GET /post_articles/1/edit
  def edit
  end

  # POST /post_articles
  # POST /post_articles.json
  def create
    @post_article = PostArticle.new(post_article_params)

    respond_to do |format|
      if @post_article.save
        format.html { redirect_to @post_article, notice: 'Post article was successfully created.' }
        format.json { render :show, status: :created, location: @post_article }
      else
        format.html { render :new }
        format.json { render json: @post_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_articles/1
  # PATCH/PUT /post_articles/1.json
  def update
    respond_to do |format|
      if @post_article.update(post_article_params)
        format.html { redirect_to @post_article, notice: 'Post article was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_article }
      else
        format.html { render :edit }
        format.json { render json: @post_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_articles/1
  # DELETE /post_articles/1.json
  def destroy
    @post_article.destroy
    respond_to do |format|
      format.html { redirect_to post_articles_url, notice: 'Post article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /post_articles/1/next
  def next
      @post_articles = PostArticle.where("id > :current_id", {current_id: params[:id]}).order(created_at: :asc).limit(1)
      if !(@post_articles.empty?)
        @post_article = @post_articles[0]
      end
      render :show
  end

  # GET /post_articles/1/previous
  def previous
      @post_articles = PostArticle.where("id < :current_id", {current_id: params[:id]}).order(created_at: :desc).limit(1)
      if !(@post_articles.empty?)
        @post_article = @post_articles[0]
      end
      render :show
  end

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_article
      @post_article = PostArticle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_article_params
      params.require(:post_article).permit(:title, :notes, :image, :category, :keywords)
    end
end
