class V1::ArticlesController < ApplicationController

    # include RestfulApiAuthentication
    # respond_to :json, :xml
    # before_action :authenticated?

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.create(article_params)
        if @article.valid?
            @article.save
            render json: {
                "message": "Article created!"
            }, status: :ok
        else
            render json: {
                "message": "Error",
                "errors": @article.errors.full_messages
            },
            status: :bad_request
        end
    end


    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            render json: {
                "message": "Article updated!",
                "data": @article
            }, status: :ok
        else
            render json: {
                "message": "Error",
                "errors": @article.errors.full_messages
            },
            status: :bad_request
        end
    end

    def destroy
        @article = Article.find(params[:id])
        if @article.destroy
            render json: {
                "message": "Article deleted!",
            }, status: :ok
        else
            render json: {
                "message": "Error",
                "errors": @article.errors.full_messages
            },
            status: :bad_request
        end

    end

    private

    def article_params
        params.permit(:title, :body, :user_id)
    end
end
