class CodeSnippetsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :edit ]
    before_action :set_code_snippet, only: [ :preview, :edit, :update ]
    before_action :check_admin, only: [ :new, :create, :edit ]
    def new
      @code_snippet = CodeSnippet.new
    end

    def create
      @code_snippet = CodeSnippet.new(code_snippet_params)
      @code_snippet.course_id = params[:code_snippet][:course_id]
      if @code_snippet.save
        redirect_to preview_code_snippet_path(@code_snippet)
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @code_snippet.update(code_snippet_params)
        # Redirecting back to the same page (refreshing the page)
        redirect_to code_snippet_path(@code_snippet), notice: "Code compiled successfully."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def preview
    end

    private

    def code_snippet_params
      params.require(:code_snippet).permit(:code)
    end

    def set_code_snippet
      @code_snippet = CodeSnippet.find(params[:id])
    end

    def check_admin
      if user_signed_in? && current_user.role != "admin"
        redirect_to root_path, alert: "You are not allowed to visit this page!"
      end
    end
end
