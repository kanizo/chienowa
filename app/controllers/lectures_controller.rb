class LecturesController < ApplicationController
  def index
    @editors_all = Editor.all
  end
end
